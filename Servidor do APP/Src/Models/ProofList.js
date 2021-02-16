const mongoose = require('mongoose');

const ProofListSchema = new mongoose.Schema({
    Title: {
        type: String,
        required: true,
    },
    Course: {
        type: String,
        required: true,
    },
    Image: {
        type: String,
        required: true,
    },

});

mongoose.model('ProofList', ProofListSchema)