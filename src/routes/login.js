const express=require("express"); 
const router =  express.Router(); 
const bodyparse=require("body-parser"); 
const path=require("path"); 
const multer=require("multer"); 
const pool = require('../database')
const  passport =  require('passport');

router.get('/signin',(req,res)=>{
    res.render('links/login/login');
});

router.post('/signin',(req,res,next)=>{
    passport.authenticate('local.signin',{
        successRedirect: '/profile',
        failureRedirect:'/signin'
    })(req,res,next); 
});

router.get('/profile',(req,res)=>{
        res.render('links/ventas/formularioVentas');
});


// router.post('/',passport.authenticate('local.signup',{
//         succesRedirect:'/profile',
//         failureRedirect: '/',
//         failureFlash: true
// }));

// router.get('/profile',(req,res)=>{
//     res.send('enviar');
// });

//  router.post('/',(req,res,next)=>{
//         passport.authenticate('local.signin',{
//             successRedirect:'/profile',
//             failureRedirect:'/',
//             failureFlash:true
//         })(req,res,next);
//  });

module.exports = router; 