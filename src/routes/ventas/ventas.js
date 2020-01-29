
const express=require("express"); 
const router =  express.Router(); 
const bodyparse=require("body-parser"); 
const path=require("path"); 
const multer=require("multer"); 
const pool = require('../../database');
const session  = require('express-session');
const {format} = require('fecha');  


const  rutimage=path.join(__dirname,"../../files");

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
    const clientes  = await pool.query("SELECT * FROM clientes");    
    res.render('links/ventas/formularioVentas',{clientes});
  });
  
  router.post('/',async(req,res)=>{
    const clientes  = await pool.query("SELECT * FROM clientes  where  nombre like ?",'%'+[req.body.clientes]+'%');
    res.send(clientes)
  });

  router.post("/add",upload.array('gimg', 12), async(req,res)=> {
    console.log(req.user.idacceso);
    
    let data =  JSON.stringify(req.body).toUpperCase();
    let {ORDEN,NUMEROCOTIZACION,NOMBRE,IMPORTE,OBSERVACIONES,RUTA} = JSON.parse(data);
    if(NOMBRE  === undefined)  return; 
    const id  =  await pool.query('SELECT idcliente  FROM clientes where nombre   = ?', [NOMBRE] ); 
    let  pedido  = {
        id_pedido:null, 
        idcliente: id[0].idcliente,
        id_empleado : 1, //cambiar cuand0 haga el login
        orden_de_compra: ORDEN,
        ruta: RUTA,
        estatus: 1 ,
        ruta_pdf_orden_compra: req.files[0].filename,
        cotizacion: NUMEROCOTIZACION,
        ruta_pdf_cotizacion: req.files[1].filename
        }; 

   if( /^[0-9a-zA-Z]+$/.test(ORDEN) || /^[0-9a-zA-Z]+$/.test(NUMEROCOTIZACION)) {
         await pool.query("INSERT INTO  pedidos  set ?", [pedido]);
         const idPedido  = await pool.query('select id_pedido from pedidos where orden_de_compra = ? and cotizacion = ?',[ORDEN,NUMEROCOTIZACION]);

         let infoPedido  = {
          id_informacion_pedido: null, 
          id_pedido: idPedido[0].id_pedido,
          observaciones: OBSERVACIONES,
          importe : IMPORTE,
          fecha_pedido:format(new Date(), 'YYYY-MM-DD'),
          estatus: 1
        }
        await pool.query("INSERT INTO informacion_pedido set ?",[infoPedido]);
        req.flash('success','Pedido Guardado' ); 
        res.redirect('/ventas')  ; 
      }
  });
module.exports = router; 