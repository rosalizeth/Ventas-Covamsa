const express=require("express"); 
const router =  express.Router(); 
const bodyparse=require("body-parser"); 
const path=require("path"); 
const multer=require("multer"); 
const pool = require('../database');

router.get('/',(req,res)=>{
    res.send('holas'); 
});

module.exports = router; 