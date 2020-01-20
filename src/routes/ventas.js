
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
    res.render('links/ventas/formularioVentas');
  });
  

  router.post("/add",upload.array('gimg', 12),function (req,res) {
    let data =  JSON.stringify(req.body).toUpperCase();
    let {ORDEN,NUMEROCOTIZACION,RUTA,IMPORTE,OBSERVACIONES} = JSON.parse(data);
      if( !/^[0-9a-zA-Z]+$/.test(ORDEN) || !/^[0-9a-zA-Z]+$/.test(NUMEROCOTIZACION) ) console.log('hola');
         
      
    res.render('links/ventas/formularioVentas'); 
    
  });

  router.get('/busqueda/:id',async(req,res)=>{
    const {id} =  req.params;
    const cliente  = await  pool.query('select nombre from clientes where idcliente = ?',[id]);
    res.render('links/ventas/formularioVentas',{cliente});
});

router.get("/busquedaCliente",async(req,res)=>{
      const  info = await pool.query("SELECT * FROM clientes ORDER BY nombre ASC");
      console.log(info);
      res.render('links/ventas//busquedaClientes',{info}); 
}); 

router.post("/busquedaCliente", async(req,res)=>{
  const {search} =  req.body; 
  const  info  = await pool.query("SELECT * FROM clientes  where  nombre like ?",'%'+search+'%');
  res.render('links/ventas/busquedaClientes',{info}); 
  
}); 

module.exports = router; 