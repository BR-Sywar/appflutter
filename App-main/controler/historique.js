const Historique = require ("../model/historique")



exports.Historique = async (req,res) => {

     
    const Puissance= req.body.Puissance
    const Tension = req.body.Tension
    const Courant =req.body.Courant
    const Temperature =req.body.Temperature

    const existe = await Historique.find({Puissance,Temperature,Tension,Courant});

    console.log(existe);
    try {
      
        if (!existe) {

            return res.status(401).json("Erreur")  
        } 
    } 

    
    catch (error) {
        res.status(400).json(error)
        console.log(error);
    }

}