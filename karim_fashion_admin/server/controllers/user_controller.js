const { Op } = require("sequelize")
const UserModel = require("../models/users_model")
const { secret, saltRounds } = require("../utils/constants")
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")

class UserController {
  static getProfile(req, res) {
    const id = req.idUser

    UserModel.findOne({
      where: { id }
    })
      .then((user) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil profil user",
          data: user,
        })
      })
      .catch((err) => {
        console.log(err)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: {},
        })
      })
  }

  static updateProfil(req, res) {
    const id = req.idUser
    const data  = req.body

    UserModel.update(data, {
      where: { id }
    })
      .then((_) => {
        res.status(200).json({
          status: true,
          message: "Berhasil update profil user",
          data: {},
        })
      })
      .catch((err) => {
        console.log(err)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: {},
        })
      })
  }

  static ubahPassword(req, res) {
    const id = req.idUser
    const { passwordLama, passwordBaru }  = req.body

    const user = UserModel.findByPk(id)
      .catch((err) => {
        console.log(err)
        res.status(401).json({
          status: false,
          message: "Anda belum login",
          data: {}
        })
        return
      })

      const validation = bcrypt.compareSync(passwordLama, user.password)
      if (!validation) {
        res.status(401).json({
          status: false,
          message: "Password Anda salah",
          data: {},
        })
        return
      }

    const password = bcrypt.hashSync(passwordBaru, saltRounds)

    UserModel.update({ password }, {
      where: { id }
    })
      .then((_) => {
        res.status(200).json({
          status: true,
          message: "Berhasil ubah password",
          data: {},
        })
      })
      .catch((err) => {
        console.log(err)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: {},
        })
      })
  }

  static async registerUser(req, res) {
    try {

      const data = req.body
      const { username, email } = data

      const existingUsername = await UserModel.findOne({
        where: { username }
      })
      if (existingUsername) {
        res.status(409).json({
          status: false,
          message: "Username sudah terdaftar",
          data: {},
        })
        return
      }
      const existingEmail = await UserModel.findOne({
        where: { email }
      })
      if (existingEmail) {
        res.status(409).json({
          status: false,
          message: "Email sudah terdaftar",
          data: {},
        })
        return
      }
  
      const user = await UserModel.create(data)
      const { id } = user
      const token = jwt.sign({ id }, secret)
      
      await UserModel.update({ token }, {
        where: { id }
      })
      
      res.status(200).json({
        status: true,
        message: "Berhasil menambahkan user",
        data: { user, token },
      })

    } catch (error) {
      console.log(error)
      res.status(500).json({
        status: false,
        message: "Terjadi kesalahan, silahkan coba lagi",
        data: {},
      })
    }
  }

  static async loginUser(req, res) {
    try {

      const { username, email, password } = req.body
  
      const user = await UserModel.findOne({
        where: {
          [Op.or]: [{ username }, { email }]
        }
      })
      if (user === null) {
        res.status(401).json({
          status: false,
          message: "Username / email tidak terdaftar",
          data: {},
        })
        return
      }
  
      const validation = bcrypt.compareSync(password, user.password)
      if (!validation) {
        res.status(401).json({
          status: false,
          message: "Password Anda salah",
          data: {},
        })
        return
      }
  
      const id = user.id
      const token = jwt.sign({ id }, secret)

      UserModel.update({ token }, {
        where: { id }
      }).then((_) => {
        res.status(200).json({
          status: true,
          message: "Berhasil login",
          data: { user, token },
        })
      })
      
    } catch (error) {
      console.log(error)
      res.status(500).json({
        status: false,
        message: "Terjadi kesalahan, silahkan coba lagi",
        data: {},
      })
    }
  }

  static logoutUser(req, res) {
    const id = req.idUser

    UserModel.update({ token: null }, {
      where: { id }
    })
      .then((_) => {
        res.status(200).json({
          status: true,
          message: "Berhasil logout",
          data: {},
        })
      })
      .catch((error) => {
        console.log(error)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: {},
        })
      })
  }
}

module.exports = UserController