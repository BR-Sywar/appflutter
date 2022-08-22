const data = require ("../model/data")



exports.data = async (req,res) => {

   
    
     try{

        const data = await data.find({}).sort({createdAt:-1});

        console.log(data);

     
        res.status(200).json({message:" data" , response : data})


     }
     catch (error) {
        res.status(400).json(error)
        console.log(error);
    }

  
    }


    exports.adddata = async (req,res) => {
      
      
      
      
      const Puissance= req.body.Puissance
      const Tension = req.body.Tension
      const Courant =req.body.Courant
      const Temperature =req.body.Temperature
      
       try{
  
          const newdata = new data ({Puissance,Tension,Courant ,Temperature })
        
            
             let resultat = await newdata.save()
             res.status(200).json({message:"Nouveau data" , response : resultat})
  
  
       }
       catch (error) {
          res.status(400).json(error)
          console.log(error);
      }
  
    
      }
  
