const mysql  = require('mysql'); 
const  {promisify} = require('util');// se utiliza para usar promesas
const database ={
    host: 'localhost',
    user:'root',
    password:'',
    database:'mydb'
    
}


const pool = mysql.createPool(database); //tiene hilos que se van ajecutando y cada uno va haciendo una tarea en ssecuencia 
pool.getConnection((err,conexion)=>{
    if(err){
        if(err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.log('la base de datos fue cerrada ');
        }
        if(err.code === 'ER_CON:COUT_ERROR'){
            console.error('DATABASE MAS TOO MANY CONNECTIONS');
        }
        if(err.code === 'ECONNREFUSED'){
            console.error('database connection was refused');
            
        }
    }
    if(conexion) conexion.release();
    console.log('db is connected');
    
});
// para utilizar la conexion 
pool.query = promisify(pool.query); // utilizar asyn o promesas 
module.exports = pool; 