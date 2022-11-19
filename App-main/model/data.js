const mongoose=require('mongoose')
const data = new mongoose.Schema({
    puissance : Number   ,
    tension : Number ,
    courant : Number ,
    temperature : Number ,
   date : String ,

} ,
)

module.exports = mongoose.model("data", data)