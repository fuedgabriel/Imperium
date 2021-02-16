const mongoose = require('mongoose');

const Course = mongoose.model('Course');

module.exports = {
  async insert(req, res) {
    const Videos = await Course.create(req.body);

    return res.json(Videos);
  },
  async selectall(req, res) {
    const Videos = await Course.find();
    return res.json(Videos)
  },
  async selectid(req, res) {
    const Videos = await Course.findById(req.params.id);
    return res.json(Videos)
  },


};