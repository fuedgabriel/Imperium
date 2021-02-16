const mongoose = require('mongoose');

const Colector = mongoose.model('Colector');

module.exports = {
    async insert(req, res) {
        const Videos = await Colector.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Colector.find();
        return res.json(Videos);
    },
    async findId(req, res) {
        const Videos = await Colector.findById(req.params.id);
        return res.json(Videos);
    },
    async selectid(req, res) {
        var json = req.body;
        var Videos = await Colector.find({ "User": json.User, "Question": json.Question });
        return res.json(Videos);
    },
    async update(req, res) {
        var json = req.body;
        console.log(json._id);
        const cat = await Colector.findByIdAndUpdate(req.params.id, {
            Percent: json.Percent
        }, { new: true });
        return res.send(cat);
    }



};