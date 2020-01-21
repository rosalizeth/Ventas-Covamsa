const bcrypt  = require('bcryptjs');
const helpers = {}
helpers.encyptPassword = async (password)=>{
    const salt =  await bcrypt.genSalt(10);
    const hash = await   bcrypt.hash(password,salt);// para cifrar  
    return hash; 
}

helpers.matchPassword = async(password,savedPassword)=>{
    try {
      return  await bcrypt.compare(password,savedPassword)   
    } catch (error) {
        console.log(error);   
    }
     
}
module.exports = helpers; 