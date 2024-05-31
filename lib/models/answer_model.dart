class Answer {
  String id;
  String content;
  int votes;

  Answer({
    required this.id,
    required this.content,
    this.votes = 0,
  });
}
