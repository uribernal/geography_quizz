import 'dart:ui';

import 'package:geography_quizz/utils/data_saver.dart';

import '../utils/question.dart';
import '../utils/data_manager.dart';


class Quiz{
  // UI parameters
  String name;
  Color color;
  String icon;

  // IA parameters
  int _index;
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _scoreCount = 0;
  int _errorCount = 0;
  int _questionCount = 0;
  double _maximumScore;
  //double _maximumScore2 = 0.0;

  Quiz(this._index, this.name, this.color, this.icon){
    DataGenerator dataGenerator = new DataGenerator();
    _questions =  dataGenerator.getQuestions(_index);
    _questionCount = _questions.length;


    getSavedScore(name).then((result) {
      // If we need to rebuild the widget with the resulting data,
      // make sure to use `setState`
        _maximumScore = result;
    });

  }

  List<Question> get questions => _questions;
  int get score => _scoreCount;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;

  Question get nextQuestion {
    _currentQuestionIndex ++;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect){
    if (isCorrect) _scoreCount ++;
    else _errorCount ++;
  }

  int get numErrors{
    return _errorCount;
  }

  int get numQuestions{
    return _questionCount;
  }
  double get maximumScore{
    return _maximumScore;
  }

  //double get maximumScore2{
  //  return _maximumScore2;
  //}
  String getDescription() {
    return ("There are " + _questionCount.toString() + " questions in this quiz.");
  }

  Future<double> getSavedScore(String name) async {
    return await DataSaver.readData(name);
  }

  saveScore(double data) {
    DataSaver.saveData(name, data);
  }

  resetScores(){
    saveScore(_scoreCount/_questionCount);
    //_maximumScore = _scoreCount/_questionCount;
    _scoreCount = 0;
    _errorCount = 0;
  }

}