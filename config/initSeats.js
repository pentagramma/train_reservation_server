const { sequelize, Seat } = require('../models');

const initSeats = async () => {
  await sequelize.sync({ force: true });
  const seats = Array.from({ length: 80 }, (_, i) => ({
    id: i + 1,
    isBooked: true,
  }));
  await Seat.bulkCreate(seats);
  console.log('Seats initialized');
  process.exit();
};

initSeats();