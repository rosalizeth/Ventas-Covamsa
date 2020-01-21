const  passport =  require('passport');// para autentificaciones
const Strategy = require('passport-local').Strategy; 
const pool = require('../database');
const helpers =  require('../lib/helpers');

passport.use('local.signin',new Strategy({
    usernameField:'email',
        passwordField:'password',
        passReqToCallback:true
},async (req,username,password,done)=>{
 
    const rows = await pool.query('select * from acceso where correo = ? ',[username]);
    if(rows.length > 0){
        
        const user = rows[0]; 
        const validPassword =  await  helpers.matchPassword(password,user.password); 
        if(validPassword){
            console.log('vienvenido');
            done(null,user)
        } else{
            done(null,false,)
        }
    }else{
        return done(null,false ,)
    }
}));

// registrar al usuario ------------------------------
// passport.use('local.signup', new Strategy({
//     usernameField:'email',
//     passwordField:'password',
//     passReqToCallback:true

// },async(req,username,password,done)=>{
//     // se unsa para insertar los datos de un nuevo usuario 
//     let id = 2;
//     const newUser = {
   
//         correo:username,
//         password
//     }
//    newUser.password =  await  helpers.encyptPassword(password); // cifrar contra
//    console.log(newUser);
    
//    const result =  await pool.query('INSERT INTO acceso SET ? ', [newUser]);
//    newUser.id = result.insertId; 
//     return done(null, newUser);
    
// }));
// passport.serializeUser((usr,done)=>{
//     done(null,usr.id)
// });

// passport.deserializeUser( async(id,done)=>{
//    const filas = await pool.query('select * from acceso where  idaccedo = ?',[id]);
//    done(null,filas[0])
// })