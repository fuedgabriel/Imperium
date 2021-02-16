const mongoose = require('mongoose');

const Episteme = mongoose.model('Episteme');

module.exports = {
    async insert(req, res) {
        const Videos = await Episteme.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Episteme.find();
        return res.json(Videos)
    },
    async findType(req, res) {
        const Videos = await Episteme.find({ "Type": req.params.Type });
        return res.json(Videos)
    }


};