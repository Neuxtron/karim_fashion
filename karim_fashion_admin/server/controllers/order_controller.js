const KeranjangModel = require("../models/keranjang_model")
const OrderModel = require("../models/order_model")
const StokModel = require("../models/stok_model")
const KeranjangController = require("./keranjang_controller")

class OrderController {
  static createOrder(req, res) {
    const order = req.body.order
    const listKeranjangRaw = req.body.keranjang
    const idUser = req.idUser

    if (order.metodeBayar === "COD") {
      order.status = "Dikirim"
    }
    
    OrderModel.create({...order, idUser})
      .then(async (data) => {
        const listKeranjang = listKeranjangRaw.map(keranjang => {
          keranjang.idOrder = data.id
          return keranjang
        })
        
        const promises = listKeranjang.map((keranjang) => {
          return StokModel.decrement("stok", {
            where: { id: keranjang.idStok }
          })
        })

        await Promise.allSettled(promises)

        await KeranjangController.updateKeranjangLocal(listKeranjang, idUser)
        res.status(201).json({
          status: true,
          message: "Berhasil membuat order",
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

module.exports = OrderController