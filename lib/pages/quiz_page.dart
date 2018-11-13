
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/anwer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;
  QuizPage(this.quiz);

  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  RestartableTimer timer;
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();

    currentQuestion = widget.quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = widget.quiz.questionNumber;

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
    widget.quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }

  void dispose(){
    timer.cancel();
    super.dispose();
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
            if (widget.quiz.length == questionNumber || widget.quiz.numErrors > 3){
              overlayShouldBeVisible = false;
              //DataSaver.saveData(widget.quiz.name, widget.quiz.score/widget.quiz.questionNumber);
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(widget.quiz)),  ModalRoute.withName(Navigator.defaultRouteName));
              //return;
            }
            currentQuestion = widget.quiz.nextQuestion;
            this.setState( () {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = widget.quiz.questionNumber;
              // tornar a iniciar contador
              timer.reset();
            }
            );
          }
      ): new Container(),
    ],
    );
  }


}
