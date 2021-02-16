const mongoose = require('mongoose');

const Lives = mongoose.model('Lives');

module.exports = {
    async insert(req, res) {
        const Videos = await Lives.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Lives.find();
        return res.json(Videos)
    }


};