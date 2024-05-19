const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const bcrypt = require("bcrypt")
const { saltRounds } = require("../utils/constants")

const UserModel = sequelize.define("users", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  username: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  hp: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  alamat: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  idKecamatan: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  token: {
    type: DataTypes.STRING,
    allowNull: true,
  },
}, {
  freezeTableName: true,
  hooks: {
    beforeCreate(user, options) {
      user.password = bcrypt.hashSync(user.password, saltRounds)
    }
  }
})

module.exports = UserModel