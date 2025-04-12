const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const { Seat, User } = require('../models');

router.get('/', auth, async (req, res) => {
  try {
    const seats = await Seat.findAll({
      attributes: ['id', 'isBooked', 'userId'],
      order: [['id', 'ASC']], // Sort by id numerically
    });
    
    console.log('Fetched seats:', seats.map(seat => seat.id));
    
    if (seats.length !== 80) {
      console.warn('Unexpected seat count:', seats.length);
      return res.status(500).json({ message: `Expected 80 seats, found ${seats.length}` });
    }
    
    // Create a properly ordered seatMap based on sequential IDs
    const seatMap = [];
    
    // Create 11 rows, the first 10 with 7 seats, the last with 10 seats
    for (let i = 0; i < 11; i++) {
      if (i < 10) {
        // First 10 rows have 7 seats each (IDs 1-70)
        seatMap.push(seats.slice(i * 7, (i + 1) * 7));
      } else {
        // Last row has the remaining 10 seats (IDs 71-80)
        seatMap.push(seats.slice(70, 80));
      }
    }
    
    console.log('seatMap IDs:', seatMap.map(row => row.map(seat => seat.id)));
    
    res.json({ seatMap, userId: req.user.id });
  } catch (err) {
    console.error('Seats error:', err);
    res.status(500).json({ message: err.message });
  }
});

router.post('/reserve', auth, async (req, res) => {
  try {
    const { numSeats } = req.body;
    console.log('Reserve request:', { numSeats, userId: req.user.id });
    if (!numSeats || numSeats < 1 || numSeats > 7) {
      return res.status(400).json({ message: 'Invalid number of seats' });
    }

    const availableSeats = await Seat.findAll({
      where: { isBooked: false },
      order: [['id', 'ASC']], // Ensure lowest IDs first
      limit: numSeats,
    });

    console.log('Available seats:', availableSeats.map(seat => seat.id));
    if (availableSeats.length < numSeats) {
      return res.status(400).json({ message: 'Not enough seats available' });
    }

    const seatIds = availableSeats.map(seat => seat.id);
    await Seat.update(
      { isBooked: true, userId: req.user.id },
      { where: { id: seatIds } }
    );

    console.log('Updated seats:', seatIds);
    res.json({ message: 'Seats booked successfully', seats: availableSeats });
  } catch (err) {
    console.error('Reserve error:', err);
    res.status(500).json({ message: err.message });
  }
});

router.post('/reset', auth, async (req, res) => {
  try {
    if (req.user.role !== 'admin') {
      return res.status(403).json({ message: 'Admin access required' });
    }

    await Seat.update({ isBooked: false, userId: null }, { where: {} });
    res.json({ message: 'Seats reset successfully' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;