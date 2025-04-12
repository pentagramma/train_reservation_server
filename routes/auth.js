const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { User } = require('../models');

router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }

    const user = await User.findOne({ where: { email } });
    if (!user || !(await bcrypt.compare(password, user.password))) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }

    const token = jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET || 'my_secure_train_secret_2025', { expiresIn: '1h' });
    res.json({ user: { id: user.id, email: user.email, role: user.role }, token });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

router.post('/signup', async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }

    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ message: 'Email already exists' });
    }

    const user = await User.create({ email, password });
    const token = jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET || 'my_secure_train_secret_2025', { expiresIn: '1h' });
    res.json({ user: { id: user.id, email: user.email, role: user.role }, token });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;