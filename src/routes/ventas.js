
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
  

  router.post("/add",upload.array('gimg', 12),function (req,res) {
    let data = req.body; 
    res.render('links/formularioVentas'); 
    
  });
  router.get('/busqueda/:id',async(req,res)=>{
    const {id} =  req.params;
    console.log(id);
    const cliente  = await  pool.query('select nombre from clientes where idcliente = ?',[id]);
    console.log(cliente);
    res.render('links/formularioVentas',{cliente});
});

router.get("/busquedaCliente",async(req,res)=>{
      const  info = await pool.query("SELECT * FROM clientes ORDER BY nombre ASC");
      console.log(info);
      res.render('links/busquedaClientes',{info}); 
}); 
router.post("/busquedaCliente", async(req,res)=>{
  const {search} =  req.body; 
  const  info  = await pool.query("SELECT * FROM clientes  where  nombre like ?",'%'+search+'%');
  res.render('links/busquedaClientes',{info}); 
  
}); 


module.exports = router; 