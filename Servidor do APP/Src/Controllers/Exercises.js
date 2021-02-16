const mongoose = require('mongoose');

const Exercises = mongoose.model('Exercises');

module.exports = {
    async insert(req, res) {
        const Videos = await Exercises.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Exercises.find();
        return res.json(Videos)
    },
    async selectid(req, res) {
        const Videos = await Exercises.findById(req.params.id);
        return res.json(Videos)
    },
    async selectsearch(req, res) {
        const Videos = await Exercises.find({ "Questions": req.params.Question });
        return res.json(Videos)
    },

};