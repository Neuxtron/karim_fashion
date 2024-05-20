const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const VariasiModel = require("./variasi_model")

const StokModel = sequelize.define("stok", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  idVariasi: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  idProduk: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  stok: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

StokModel.belongsTo(VariasiModel, { as: "variasi", foreignKey: "idVariasi", onDelete: "CASCADE" })

module.exports = StokModel