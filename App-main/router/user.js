const express= require('express')
const router=express.Router()
const UserCtrl=require("../controler/user")
const Data = require("../controler/data")
const Historique = require("../controler/historique")



router.post("/login", UserCtrl.login)
router.post("/registre", UserCtrl.registre)
router.get("/getdata", Data.data)
router.post("/adddata", Data.adddata)
router.post("/Historique", Historique.Historique)

module.exports = router