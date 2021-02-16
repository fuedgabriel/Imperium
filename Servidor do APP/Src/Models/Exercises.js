const mongoose = require('mongoose');

const ExercisesSchema = new mongoose.Schema({
    Title: {
        required: false,
        type: String
    },
    SubTitle: {
        required: false,
        type: String
    },
    Image: {
        required: false,
        type: String
    },
    TitlePos: {
        required: false,
        type: String
    },
    SubTitlePos: {
        required: false,
        type: String
    },
    Answers: {
        required: true,
        type: Array
    },
    Correct: {
        required: true,
        type: Number
    },
    Questions: {
        required: true,
        type: String
    }

});

mongoose.model('Exercises', ExercisesSchema)