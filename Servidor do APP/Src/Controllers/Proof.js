const mongoose = require('mongoose');

const Proof = mongoose.model('Proof');

module.exports = {
    async insert(req, res) {
        const Videos = await Proof.create(req.body);

        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Proof.find();
        return res.json(Videos)
    },
    async selectid(req, res) {
        const Videos = await Proof.findById(req.params.id);
        return res.json(Videos)
    },
};