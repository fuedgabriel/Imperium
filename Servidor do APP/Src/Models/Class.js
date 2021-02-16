const mongoose = require('mongoose');

const ClassSchema = new mongoose.Schema({
    Title: {
        type: String,
        required: true,
    },
    Link: {
        type: String,
        required: false,
    },
    Doc: {
        type: String,
        required: false,
    },
    Matter: {
        type: String,
        required: true,
    },

});

mongoose.model('Class', ClassSchema)