const mongoose = require('mongoose');

const ExercisesColectorSchema = new mongoose.Schema({
    User: {
        required: true,
        type: String
    },
    Question: {
        required: true,
        type: String
    },
    Percent: {
        required: true,
        type: Number
    }
});

mongoose.model('Colector', ExercisesColectorSchema)
