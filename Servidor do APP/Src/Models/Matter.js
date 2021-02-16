const mongoose = require('mongoose');

const MatterSchema = new mongoose.Schema({
    Title: {
        required: true,
        type: String
    },
    Course: {
        required: true,
        type: String
    },
    Image: {
        required: true,
        type: String
    }
});

mongoose.model('Matter', MatterSchema)