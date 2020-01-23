const  passport =  require('passport');// para autentificaciones
const Strategy = require('passport-local').Strategy; 
const pool = require('../database');
const session = require('express-session')

passport.use('local.signin', new Strategy({
        usernameField:'email',
        passwordField: 'password',
        passReqToCallback: true 
}, async(req,email,password,done)=>{ 
        
    const rows =   await pool.query("SELECT * FROM  acceso WHERE  correo = ?  and password = ? ",[email,password]); 
   if(rows.length > 0){
       const user = rows[0]; 
        // const validPassword =   await helpers.matchPassword(password,user.password); validar contraseña convertida 
        done(null,user)
   }else{
        done(null,false); 
   }
})); 

passport.serializeUser((user, done)=> {
        done(null, user.idacceso);
});
passport.deserializeUser( async (id, done)=> {
        const rows =   await pool.query('select * from acceso where idacceso = ?',[id]); 
        done(null, rows[0]);
});

