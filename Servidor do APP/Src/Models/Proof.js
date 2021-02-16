const mongoose = require('mongoose');

const ProofSchema = new mongoose.Schema({
    Title: {
        type: String,
        required: true,
    },
    Image: {
        type: String,
        required: true,
    },

});

mongoose.model('Proof', ProofSchema)