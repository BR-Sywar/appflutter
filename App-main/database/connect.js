const mongoose=require('mongoose')
const User = require ('../model/user')
const bcrypt = require ('bcryptjs')
const data= async()=>{
    try {
        await mongoose.connect('mongodb://localhost:27017/App',
        {
            useNewUrlParser : true , 
            useUnifiedTopology : true , 
              
         },
         async(error)=>{
             if (error)
             {
                 console.log(error)
           }
           else{

         let admin=await User.findOne({role : 'admin'})
           if (!admin){

           const user = new User({
               Nom: "Admin",
               Prenom: "Admin",
               Email:"Admin@gmail.com",
               role:"admin",
               
           });
           const pass="123456"
           const salt = await bcrypt.genSalt(10)
           user.Password=await bcrypt.hash(pass,salt)

            await user.save()
            console.log('user save ')
           }
           else {
               console.log('user existe')
               
           }
        };
          
         }

    )
    console.log('data base connect' )
   } 
   catch (error)
   {
   console.log(error)
   console.log('data base not connect ')
   };
   
}
module.exports=data
