const { Sequelize, DataTypes } = require('sequelize');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const sequelize = new Sequelize({
  dialect: 'postgres',
  host: process.env.PG_HOST || 'localhost',
  port: process.env.PG_PORT || 5432,
  database: process.env.PG_DATABASE || 'train_reservation',
  username: process.env.PG_USER || 'sarthak',
  password: process.env.PG_PASSWORD || '258036',
});

const User = sequelize.define('User', {
  email: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
    validate: {
      isEmail: true,
    },
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  role: {
    type: DataTypes.STRING,
    defaultValue: 'user',
  },
}, {
  hooks: {
    beforeSave: async (user) => {
      if (user.changed('password')) {
        user.password = await bcrypt.hash(user.password, 10);
      }
    },
  },
});

const Seat = sequelize.define('Seat', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
  },
  isBooked: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  userId: {
    type: DataTypes.INTEGER,
    references: {
      model: User,
      key: 'id',
    },
  },
});

User.hasMany(Seat);
Seat.belongsTo(User);

module.exports = { sequelize, User, Seat };