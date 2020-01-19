
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

  router.get('/',(req,res)=>{
    res.render('links/formularioVentas');
  });

  router.post("/add",upload.array('gimg', 12),function (req,res) {
    let data = req.body; 
    console.log(req.files);
    
   });


module.exports = router; 