const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const { Seat, User } = require('../models');

router.get('/', auth, async (req, res) => {
  try {
    const seats = await Seat.findAll({
      attributes: ['id', 'isBooked', 'userId'],
    });
    const seatMap = [];
    for (let i = 0; i < 11; i++) {
      const row = seats.slice(i * 7, i * 7 + 7);
      if (i === 10) row.push(...seats.slice(77, 80));
      seatMap.push(row);
    }
    res.json({ seatMap, userId: req.user.id });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

router.post('/reserve', auth, async (req, res) => {
  try {
    const { numSeats } = req.body;
    if (!numSeats || numSeats < 1 || numSeats > 7) {
      return res.status(400).json({ message: 'Invalid number of seats' });
    }

    const availableSeats = await Seat.findAll({
      where: { isBooked: false },
      limit: numSeats,
    });

    if (availableSeats.length < numSeats) {
      return res.status(400).json({ message: 'Not enough seats available' });
    }

    await Seat.update(
      { isBooked: true, userId: req.user.id },
      { where: { id: availableSeats.map(seat => seat.id) } }
    );

    res.json({ message: 'Seats booked successfully', seats: availableSeats });
  } catch (err) {
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