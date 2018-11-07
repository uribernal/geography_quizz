import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/anwer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  final int game;
  QuizPage(this.game);

  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz;
  RestartableTimer timer;
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();
    print(widget.game.toString());

    quiz = new Quiz(widget.game);

    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;

    const timeout = const Duration(seconds: 8);
    const ms = const Duration(milliseconds: 8000);

    void handleTimeout() {  // callback function for timer
      // Responem incorrectament
      if (overlayShouldBeVisible == false)
        handleAnswer("");
    }

    startTimeout([int milliseconds]) {
      var duration = milliseconds == null ? timeout : ms * milliseconds;
      return new RestartableTimer(duration, handleTimeout);
    }

    timer = startTimeout();

  }

  void handleAnswer(String answer){
    isCorrect = (currentQuestion.correctAnswer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(// This is our main page
          children: <Widget>[
            new AnswerButton(currentQuestion.getPosibleAnswer(0), Colors.purpleAccent, () => handleAnswer(currentQuestion.getPosibleAnswer(0))), // true button
            new AnswerButton(currentQuestion.getPosibleAnswer(1), Colors.redAccent, () => handleAnswer(currentQuestion.getPosibleAnswer(1))), // true button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(currentQuestion.getPosibleAnswer(2), Colors.yellowAccent, () => handleAnswer(currentQuestion.getPosibleAnswer(2))), // true button
            new AnswerButton(currentQuestion.getPosibleAnswer(3), Colors.orangeAccent, () => handleAnswer(currentQuestion.getPosibleAnswer(3))), // true button
          ]
        ),
      overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          !timer.isActive, // time's up
          isCorrect,
          () {
            if (quiz.length == questionNumber || quiz.numErrors > 3){
              overlayShouldBeVisible = false;
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState( () {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
              // tornar a iniciar contador
              //RestartableTimer(Duration _duration, ZoneCallback _callback)
              timer.reset();
            }
            );
          }
      ): new Container(),
    ],
    );
  }


}
