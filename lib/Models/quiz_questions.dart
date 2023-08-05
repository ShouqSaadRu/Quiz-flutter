class QuizQuestions {
  //a class that doesn't contain widget
  const QuizQuestions(this.text, this.answers); //constructre
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final ShuffeldList = List.of(
        answers); //.of it means it create a new list has the same items of the answers list then it shuffle the new list
    ShuffeldList.shuffle();
    return ShuffeldList;
  }
}
