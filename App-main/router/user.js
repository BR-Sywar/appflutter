const express= require('express')
const router=express.Router()
const UserCtrl=require("../controler/user")
const Data = require("../controler/data")
const historique = require("../controler/historique")



router.post("/login", UserCtrl.login)
router.post("/registre", UserCtrl.registre)
router.post("/adddata", Data.adddata)
router.get("/Historique", historique.Historique)
module.exports = router