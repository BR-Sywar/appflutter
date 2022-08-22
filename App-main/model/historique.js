const mongoose=require('mongoose')
const historique = new mongoose.Schema({
    Puissance : Number   ,
    Tension : Number ,
    Courant : Number ,
    Temperature : Number ,
    Time : Date ,
    Date :Date
   

} ,
{
    timestamps: true,
  })

module.exports = mongoose.model("Historique", historique)   