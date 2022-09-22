const { get } = require("http")
const data = require ("../model/data")
const moment = require("moment")
exports.Historique = async (req,res) => {

      
    
     
      try{
 
         let tab =[]
       let resultat = await data.find({})
       const resul = JSON.parse(JSON.stringify(resultat));

       resul.map(async (elem)=> {
        elem.date =  moment(new Date (elem.date)).format('M/D/Y, h:mm:ss a');
console.log(elem.date)

        tab.push(elem)
        })
      
       
       res.status(200).json({message:"Historique " , response : tab})
      }
      catch (error) {
         res.status(400).json(error)
         
         console.log(error);
     }
 
   
     }
 