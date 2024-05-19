const { Op } = require("sequelize")
const ProdukModel = require("../models/produk_model")
const VariasiModel = require("../models/variasi_model")

class ProdukController {
  static allProduk(req, res) {
    ProdukModel.findAll({
      include: [{
        association: "stok",
        include: [VariasiModel],
        where: {
          stok: { [Op.gt]: 0 }
        }
      }]
    })
      .then((data) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil data produk",
          data: data,
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
}

module.exports = ProdukController