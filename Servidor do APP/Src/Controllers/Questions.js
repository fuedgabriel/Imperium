const mongoose = require('mongoose');

const Question = mongoose.model('Question');

module.exports = {
    async insert(req, res) {
        const Videos = await Question.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Question.find();
        return res.json(Videos)
    },
    async selectid(req, res) {
        const Videos = await Question.findById(req.params.id);
        return res.json(Videos)
    },
    async selectsearch(req, res) {
        const Videos = await Question.find({ "Matter": req.params.Matter });
        return res.json(Videos)
    },


};