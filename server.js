require('dotenv').config();
const express = require('express');
const cors = require('cors');
const authRoutes = require('./routes/auth');
const seatRoutes = require('./routes/seats');

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api/auth', authRoutes);
app.use('/api/seats', seatRoutes);

// Error handler for non-JSON responses
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Server error' });
});

app.listen(5001, () => {
  console.log('Server running on port 5001');
});