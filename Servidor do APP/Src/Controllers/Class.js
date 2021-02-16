const mongoose = require('mongoose');

const Class = mongoose.model('Class');

module.exports = {
    async insert(req, res) {
        const Videos = await Class.create(req.body);
        return res.json(Videos);
    },
    async selectall(req, res) {
        const Videos = await Class.find();
        return res.json(Videos)
    },
    async selectid(req, res) {
        const Videos = await Class.findById(req.params.id);
        return res.json(Videos)
    },
    async selectsearch(req, res) {
        const Videos = await Class.find({ "Matter": req.params.Matter });
        return res.json(Videos)
    },


};
