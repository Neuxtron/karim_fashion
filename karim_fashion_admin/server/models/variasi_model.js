const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")

const VariasiModel = sequelize.define("variasi", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  nama: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

module.exports = VariasiModel