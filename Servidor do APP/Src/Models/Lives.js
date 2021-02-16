const mongoose = require('mongoose');

const LivesSchema = new mongoose.Schema({
    Title: {
        type: String,
        required: true,
    },
    Theme: {
        type: String,
        required: true,
    },
    Time: {
        type: String,
        required: true,
    },
    Image: {
        type: String,
        required: true,
    },
    Link: {
        type: String,
        required: false,
    }

});

mongoose.model('Lives', LivesSchema)