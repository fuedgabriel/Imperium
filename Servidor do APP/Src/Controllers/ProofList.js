const mongoose = require('mongoose');

const ProofList = mongoose.model('ProofList');

module.exports = {
    async insert(req, res) {
        const Videos = await ProofList.create(req.body);

        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await ProofList.find();
        return res.json(Videos)
    },
    async selectid(req, res) {
        const Videos = await ProofList.find({ "Course": req.params.id });
        return res.json(Videos)
    },
};