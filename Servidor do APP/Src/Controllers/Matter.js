const mongoose = require('mongoose');

const Matter = mongoose.model('Matter');

module.exports = {
    async insert(req, res) {
        const Videos = await Matter.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Matter.find();
        return res.json(Videos)
    },
    async selectid(req, res) {
        const Videos = await Matter.findById(req.params.id);
        return res.json(Videos)
    },
    async selectsearch(req, res) {
        const Videos = await Matter.find({ "Course": req.params.Course });
        return res.json(Videos)
    },
};