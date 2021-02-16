const mongoose = require('mongoose');

const CourseSchema = new mongoose.Schema({
  Title: {
    type: String,
    required: true,
  },
  Image: {
    type: String,
    required: true,
  },

});

mongoose.model('Course', CourseSchema)