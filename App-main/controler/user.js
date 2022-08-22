const bcrypt = require ("bcryptjs")
const User = require ("../model/user")
const secretOrkey = "azhgndnfnnfkngkjmldsmqdmlkdlkfkf"
const jwt = require ("jsonwebtoken")
 
exports.login = async  (req,res ) => {
const email = req.body.Email
const pswd = req .body.Password
const existe =await User.findOne({Email:email})
console.log(existe);
    try {
      
        if (!existe) {

            return res.status(401).json("Mail Not Existe")
            
        }
        const match = await bcrypt.compare(pswd,existe.Password)
        if (!match){
           return res.status(402).json("Erreur Password")
        }
        const payload = {
            _id: existe._id,
            type: existe.role
          };
        const token = jwt.sign(payload, secretOrkey);

    delete existe.Password;
    existe.token = token;
    res.status(200).json({
      user: existe,
       token: token

    })
        
    } catch (error) {
        res.status(400).json(error)
        console.log(error);
    }

}

exports.registre = async (req,res) => {

    const Nom= req.body.Nom
    const Prenom = req.body.Prenom
    const Email =req.body.Email
    const Password =req.body.Password
    
     try{

        const newuser = new User ({Nom,Prenom,Email ,Password ,role : "user"})
        const searchuser = await User.findOne({Email})
        console.log(searchuser);

        if(searchuser) {

            return res.status(400).json({message : "user exite"})

       }
           const salt = await bcrypt.genSalt(10)
           newuser.Password=await bcrypt.hash(Password,salt)
           let resultat = await newuser.save()
           res.status(200).json({message:"Nouveau user" , response : resultat})


     }
     catch (error) {
        res.status(400).json(error)
        console.log(error);
    }

  
    }

