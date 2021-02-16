const mongoose = require('mongoose');

const CourseProofSchema = new mongoose.Schema({
    Title: {
        type: Number,
        required: true,
    },
    Link: {
        type: String,
        required: false,
    },
    Course: {
        type: String,
        required: true,
    }

});

mongoose.model('CourseProof', CourseProofSchema)