class Question {
  final String id;
  final String questionText;
  final Map<String,bool> options;

  Question({
    required this.id,
    required this.questionText,
    required this.options
  });


  @override
  String toString() {
    // TODO: implement toString
    return 'Question(id:$id,question:$questionText, options:$options)';
  }
}