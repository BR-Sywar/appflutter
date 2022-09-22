const data = require ("../model/data")




    exports.adddata = async (req,res) => {
      
      
      
      
      const puissance= req.body.puissance
      const tension = req.body.tension
      const courant =req.body.courant
      const temperature =req.body.temperature
      const date=new Date()
       try{
  
          const newdata = new data ({puissance,tension,courant ,temperature,date })
        
            
             let resultat = await newdata.save()
             res.status(200).json({message:"Nouveau data" , response : resultat})
  
  
       }
       catch (error) {
          res.status(400).json(error)
          console.log(error);
      }
  
    
      }
  
