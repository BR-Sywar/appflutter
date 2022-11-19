const { get } = require("http")
const data = require ("../model/data")
const moment = require("moment")
exports.Historique = async (req,res) => {

      try{
 
         let tab =[]
       let resultat = await data.find({})
      // const resul = JSON.parse(JSON.stringify(resultat));
console.log(resultat)
       resultat.map(async (elem)=> {
        elem.date =  elem.date ;
//console.log(elem.puissance)

        tab.push(elem)
        })
      
       
       res.status(200).json({message:"Historique " , response : tab})
      }
      catch (error) {
         res.status(400).json(error)
         
         console.log(error);
     }
 
   
     }
 