const mongoose = require('mongoose');

const QuestionSchema = new mongoose.Schema({
    Title: {
        required: true,
        type: String
    },
    Matter: {
        required: true,
        type: String
    },
    Image: {
        required: true,
        type: String
    }
});

mongoose.model('Question', QuestionSchema)