const mongoose=require('mongoose')
const usersch = new mongoose.Schema({
    Nom :  String ,
    Prenom : String ,
    Email : String ,
    Password : String ,
    role : {
        type : String ,
        enum : ["admin", "user" ]
    }

}
)
module.exports = mongoose.model("user", usersch)