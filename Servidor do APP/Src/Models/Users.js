const mongoose = require('mongoose');

const UsersSchema = new mongoose.Schema({
  Name: {
    required: true,
    type: String
  },
  Email: {
    required: true,
    type: String
  },
  Password: {
    required: true,
    type: String
  },
  Matricula: {
    required: true,
    type: String
  },
  Courser: {
    required: true,
    type: Array
  }
});

mongoose.model('Users', UsersSchema)
