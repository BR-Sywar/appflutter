const mongoose=require('mongoose')
const data = new mongoose.Schema({
    Puissance : Number   ,
    Tension : Number ,
    Courant : Number ,
    Temperature : Number ,
   

} ,
{
    timestamps: true,
  })

module.exports = mongoose.model("data", data)