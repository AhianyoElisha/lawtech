import 'package:flutter/material.dart';
import 'package:lawtech/models/answer_model.dart';
import 'package:lawtech/models/question_model.dart';
import 'package:uuid/uuid.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> _questions = [];

  List<Question> get questions => _questions;

  void addQuestion(String title, String description) {
    final question = Question(
      id: Uuid().v4(),
      title: title,
      description: description,
    );
    _questions.add(question);
    notifyListeners();
  }

  void addAnswer(String questionId, String content) {
    final question = _questions.firstWhere((q) => q.id == questionId);
    final answer = Answer(
      id: Uuid().v4(),
      content: content,
    );
    question.answers.add(answer);
    notifyListeners();
  }

  void upvoteQuestion(String questionId) {
    final question = _questions.firstWhere((q) => q.id == questionId);
    question.votes++;
    notifyListeners();
  }

  void downvoteQuestion(String questionId) {
    final question = _questions.firstWhere((q) => q.id == questionId);
    question.votes--;
    notifyListeners();
  }

  void upvoteAnswer(String questionId, String answerId) {
    final question = _questions.firstWhere((q) => q.id == questionId);
    final answer = question.answers.firstWhere((a) => a.id == answerId);
    answer.votes++;
    notifyListeners();
  }

  void downvoteAnswer(String questionId, String answerId) {
    final question = _questions.firstWhere((q) => q.id == questionId);
    final answer = question.answers.firstWhere((a) => a.id == answerId);
    answer.votes--;
    notifyListeners();
  }
}
