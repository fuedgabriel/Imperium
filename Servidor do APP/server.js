const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const requiredir = require('require-dir');


var morgan = require('morgan')
var path = require('path')
var rfs = require('rotating-file-stream') // version 2.x

//Iniciando API
const app = express();

var accessLogStream = rfs.createStream('access.log', {
  interval: '1d', // rotate daily
  path: path.join('logs', 'log')
})

// setup the logger
app.use(morgan('combined', { stream: accessLogStream }))

app.use(express.json());
app.use(cors());

//Iniciando DB

//sua indentificação no mongodb
mongoose.connect('mongodb+srv://sua conexão', { useUnifiedTopology: true, useNewUrlParser: true })


requiredir('./Src/Models');
app.use('/api', require('./Src/routes'))

app.listen(7844);
