import '../utils/data_generator.dart';

import '../utils/question.dart';

class Quiz{
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;
  int _errorCount = 0;

  Quiz(int game){
    DataGenerator dataGenerator = new DataGenerator();
    _questions =  dataGenerator.getQuestions(game);
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get score => _score;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;

  Question get nextQuestion {
    _currentQuestionIndex ++;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect){
    if (isCorrect) _score ++;
    else _errorCount ++;
  }

  int get numErrors{
    return _errorCount;
  }

  String getDescription() {
    return ("There are " + _questions.length.toString() + " questions in this test.");
  }
}