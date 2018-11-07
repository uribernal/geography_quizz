class Question{
  final String question;
  final String correctAnswer;
  final List<String> wrongAnwers;
  List<String> _answers;

  Question(this.question, this.correctAnswer, this.wrongAnwers){
    _answers = [];
    _answers.addAll(wrongAnwers);
    _answers.add(correctAnswer);
    _answers.shuffle();
  }

  String getPosibleAnswer(int index){
    return _answers[index];
  }
}