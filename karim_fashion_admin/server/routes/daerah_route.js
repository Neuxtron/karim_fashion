const express = require("express")
const DaerahController = require("../controllers/daerah_controller")
const authentication = require("../middlewares/authentication")
const router = express.Router()

router.get("/provinsi", DaerahController.allProvinsi)
router.get("/kecamatan/:provinsi", DaerahController.kecamatanByProvinsi)
router.get("/ongkir/:kurir", authentication, DaerahController.ongkir)

module.exports = router