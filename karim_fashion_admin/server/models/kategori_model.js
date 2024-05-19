const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")

const KategoriModel = sequelize.define("kategori", {
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

module.exports = KategoriModel