const express=  require("express")
const db=require('./database/connect')
const bodyParser=require('body-parser')   
const router = require ('./router/user')
const app=express()
const schedule = require('node-schedule');
const data=require("./model/data")

const server = require('http').Server(app)
const io = require('socket.io')(server,{cors:{origin: "*"}})


app.use(bodyParser.urlencoded({
    extended:false 
})) 

app.set("view engine","ejs")
app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", " ,content-type");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    
    next();
  
  });

app.use(express.json( {extended:false}));
app.use(bodyParser.json());
db()
app.use("/user",router)
app.use(express.static('public'))

app.get("/",(req,res)=>{
res.send("bonjour a tous")
})
app.get('/home',  async (req, res) => {
  res.render("home")
});

io.on('connection',(socket)=>{

  console.log("first")
  console.log(`Connecté au client ${socket.id}`)
  
  schedule.scheduleJob('* * * * *', async function(fireDate){
   
  
   let  Data = await  data.find()
    console.log(Data);
    Data.map((val)=>{
    
      
        socket.emit('Puissance', val.Puissance);
        socket.emit('Tension', val.Tension);
        socket.emit('Courant', val.Courant);
        socket.emit('Temperature', val.Temperature);

       console.log(val)

     
    })
  });

  

 

})

const port =5000
server.listen(port,()=>{console.log(`server run sur ${port}`) })