const mongoose = require('mongoose');

const EpistemeSchema = new mongoose.Schema({
    Title: {
        type: String,
        required: true,
    },
    Link: {
        type: String,
        required: true,
    },
    Image: {
        type: String,
        required: true,
    },
    Type: {
        type: Number,
        required: true,
    }

});

mongoose.model('Episteme', EpistemeSchema)