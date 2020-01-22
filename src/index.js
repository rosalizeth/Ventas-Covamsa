const express = require('express');
const morgan = require('morgan');
const exphbs =  require('express-handlebars');
const path = require('path'); 
const passport =  require('passport');//para ejecutar codigo 
const session = require('express-session'); 
// inisialization 
const app = express();
require('./lib/passport');

// settings 
app.set('port',process.env.port|| 3000);
app.set('views',path.join(__dirname,'views')); 


app.set('port',process.env.PORT || 4000);
app.set('views',path.join(__dirname,'views')); // le dice a node donde esta la carpeta views 
app.engine('.hbs',exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'),'layouts'), //unir directorios
    partialsDir:path.join (app.get('views'),'partials'), // para reutilizar código 
    extname: '.hbs',//como  van a terminar mis archivos 
    helpers: require('./lib/handlebars')
}));
app.set('view engine','.hbs'); //para que funcione las plantillas 
app.use(express.urlencoded({extended:false}));// sirve para aceptar los datos que me manden los usuarios
app.use(express.json()); //para aceptar json 
app.use(passport.initialize());//inicializar pass
app.use(passport.session());
// middlewars 
app.use(morgan('dev')); // se utiliza para ver lo que llega al servidor
app.use(session({
    secret: 'secret',
	resave: true,
	saveUninitialized: true
})); 

// Global Variables 

app.use((req,res,next)=>{// se usa para ver que variable son accedidadas desde la aplicación 
    next(); // toma la infotmacion del usuario 
});
// routes 
app.use(require('./routes/login'));
app.use('/ventas',require('./routes/ventas'));

// Public 
app.use(express.static(path.join(__dirname,'public')));
// Starting server 
// so existe un puerto 
app.listen(app.get('port'),()=>{
console.log('server on port ',app.get('port'));
}); 
    