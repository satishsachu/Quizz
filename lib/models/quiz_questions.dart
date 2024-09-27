class QuizQuestions {
  QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getSuffle() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
