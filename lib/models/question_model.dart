// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lawtech/models/answer_model.dart';

class Question {
  String id;
  String title;
  String description;
  int votes;
  List<Answer> answers;
  Question({
    required this.id,
    required this.title,
    required this.description,
    this.votes = 0,
    List<Answer>? answers,
  }) : answers = answers ?? [];
}
