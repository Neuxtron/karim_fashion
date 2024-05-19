const { Sequelize } = require("sequelize");

const db = new Sequelize('karim-fashion', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
})

module.exports = db;