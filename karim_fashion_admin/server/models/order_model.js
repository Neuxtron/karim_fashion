const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const UserModel = require("./users_model")

const OrderModel = sequelize.define("orders", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  idUser: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  status: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: "Pending",
  },
  metodeBayar: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  ongkir: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

OrderModel.belongsTo(UserModel, { foreignKey: "idUser", onDelete: "CASCADE" })

module.exports = OrderModel