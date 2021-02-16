const mongoose = require('mongoose');

const Users = mongoose.model('Users');

module.exports = {
  async insert(req, res) {
    var json = req.body;    
    const verificarEmail = await Users.findOne({"Email": json.Email})
    const verificarMatricula = await Users.findOne({"Matricula": json.Matricula})
    var cat;
    if(verificarEmail == null && verificarMatricula == null){
      
      cat = "Cadastro efetuado com sucesso \nRetorne e comece a estudar.";
      await Users.create(json);
    }
    else if(verificarEmail != null){
      cat = "Email já cadastrado.";
    }
    else if(verificarMatricula != null){
      cat = "Matricula já cadastrada.";
    }
    else{
        cat = "Cadastro inválido; Entre em contato: Fuedgabriel@hotmail.com";
    }
    console.log(cat);
    return res.json(cat);
    
  },
  async login(req, res) {
    var json = req.body;
    if (json.Email != "" && json.Password != "") {
      const cat = await Users.findOne({ "Email": json.Email, "Password": json.Password });
      console.log("Login Efetuado");
      console.log(cat);
      return res.json(cat);
    }
    else {
      const cat = null;
      console.log("Tentativa nula");
      return res.json(cat);
    }
  },
  async selectall(req, res) {
    const cat = await Users.find();
    return res.json(cat);
  },

};
