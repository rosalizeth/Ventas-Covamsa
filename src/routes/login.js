const express=require("express"); 
const router =  express.Router(); 
const bodyparse=require("body-parser"); 
const path=require("path"); 
const multer=require("multer"); 
const pool = require('../database')
const  passport =  require('passport');

router.get('/',(req,res)=>{
    res.render('links/login/login');
});

router.post('/',(req,res,next)=>{
    passport.authenticate('local.signin',{
        successRedirect: '/profile',
        failureRedirect:'/'
    })(req,res,next); 
});



router.get('/profile',async(req,res)=>{

      const clientes  = await pool.query("SELECT * FROM clientes");    
      res.render('links/ventas/formularioVentas',{clientes});

});
router.post('/profile',async(req,res)=>{
    console.log(req.body.clientes);
    const clientes  = await pool.query("SELECT * FROM clientes  where  nombre like ?",'%'+[req.body.clientes]+'%');
    res.send(clientes)
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