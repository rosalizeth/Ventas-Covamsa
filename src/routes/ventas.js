
const express=require("express"); 
const router =  express.Router(); 
const bodyparse=require("body-parser"); 
const path=require("path"); 
const multer=require("multer"); 
const pool = require('../database');
let orden; 

const  rutimage=path.join(__dirname,"..","files"); 


  const storage=multer.diskStorage({
    destination:function (res,file,cb) {
      cb(null,rutimage)
    },
    filename:function (res,file,cb) {
      console.log(file.originalname);

      cb(null,Date.now()+file.originalname); 
    }
  }); 

  const  upload=multer({storage:storage}); 

  router.get('/',async(req,res)=>{
     names  = await pool.query("select  nombre from  clientes");
    res.render('links/formularioVentas');
  });
  
  router.get('/busqueda/:id',(req,res)=>{
      const {id} =  req.params  ;
     console.log(id);
      res.render('links/formularioVentas',{nombre:id});
  });

  router.post("/add",upload.array('gimg', 12),function (req,res) {
    let data = req.body; 
    res.render('links/formularioVentas'); 
    
  });
  router.get("/busquedaCliente",async(req,res)=>{
      const  info = await pool.query("SELECT * FROM clientes");
      console.log(info);
      res.render('links/busquedaClientes',{info}); 
  }); 


module.exports = router; 