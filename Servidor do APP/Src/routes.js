const express = require('express');
const routes = express.Router();

//Controllers
const Course = require('./Controllers/Course');
const Users = require('./Controllers/Users');
const Matter = require('./Controllers/Matter');
const Proof = require('./Controllers/Proof');
const ProofList = require('./Controllers/ProofList');
const CourseProof = require('./Controllers/CourseProof');
const Class = require('./Controllers/Class');
const Question = require('./Controllers/Questions');
const Exercises = require('./Controllers/Exercises');
const Colector = require('./Controllers/ExercisesColector');
const Lives = require('./Controllers/Lives');
const Episteme = require('./Controllers/Episteme');



//Users
routes.post('/User', Users.insert);
routes.post('/User/id', Users.login);
routes.get('/User/all/', Users.selectall);
//Course
routes.post('/Course', Course.insert);
routes.get('/Course/search/:id', Course.selectid);
routes.get('/Course/all', Course.selectall);
//Proof
routes.post('/Proof', Proof.insert);
routes.get('/Proof/search/:id', Proof.selectid);
routes.get('/Proof/all', Proof.selectall);
//ProofList
routes.post('/ProofList', ProofList.insert);
routes.get('/ProofList/search/:id', ProofList.selectid);
routes.get('/ProofList/all', ProofList.selectall);
//CourseProof
routes.post('/CourseProof', CourseProof.insert);
routes.get('/CourseProof/search/:id', CourseProof.selectid);
routes.get('/CourseProof/all', CourseProof.selectall);
//Matter
routes.post('/Course', Course.insert);
routes.get('/Course/search/:id', Course.selectid);
routes.get('/Course/all', Course.selectall);
//Matter
routes.post('/Matter', Matter.insert);
routes.get('/Matter/search/:id', Matter.selectid);
routes.get('/Matter/search/matter/:Course', Matter.selectsearch);
routes.get('/Matter/all', Matter.selectall);
//Class
routes.post('/Class', Class.insert);
routes.get('/Class/search/matter/:Matter', Class.selectsearch);
routes.get('/Class/all', Class.selectall);
//Question
routes.post('/Question', Question.insert);
routes.get('/Question/search/matter/:Matter', Question.selectsearch);
routes.get('/Question/all', Question.selectall);
//Exercises
routes.post('/Exercises', Exercises.insert);
routes.get('/Exercises/search/question/:Question', Exercises.selectsearch);
routes.get('/Exercises/all', Exercises.selectall);
//Colector
routes.post('/Colector', Colector.insert);
routes.post('/Colector/search', Colector.selectid);
routes.get('/Colector/all', Colector.selectall);
routes.get('/Colector/id/:id', Colector.findId);
routes.put('/Colector/update/:id', Colector.update);
//Lives
routes.post('/Lives', Lives.insert);
routes.get('/Lives/all', Lives.selectall);
//Episteme
routes.post('/Episteme', Episteme.insert);
routes.get('/Episteme/all', Episteme.selectall);
routes.get('/Episteme/type/:Type', Episteme.findType);


module.exports = routes;
