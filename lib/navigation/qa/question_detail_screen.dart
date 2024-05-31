import 'package:flutter/material.dart';
import 'package:lawtech/provider/question_provider.dart';
import 'package:lawtech/navigation/qa/post_answer_screen.dart';
import 'package:provider/provider.dart';

class QuestionDetailScreen extends StatefulWidget {
  const QuestionDetailScreen({super.key, required this.questionId});
  final String questionId;

  @override
  State<QuestionDetailScreen> createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {
  Map<String, int> votesState = {};
  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context);
    final question =
        questionProvider.questions.firstWhere((q) => q.id == widget.questionId);
    return Scaffold(
      appBar: AppBar(
        title: Text(question.title),
      ),
      body: Consumer<QuestionProvider>(
        builder: (context, state, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(question.description,
                    style: const TextStyle(fontSize: 20)),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Answers', style: TextStyle(fontSize: 20)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: question.answers.length,
                  itemBuilder: (context, index) {
                    final answer = question.answers[index];
                    final isUpvoted = votesState[answer.id] == 1;
                    final isDownvoted = votesState[answer.id] == -1;
                    return ListTile(
                      title: Row(
                        children: [
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                                onPressed: isUpvoted
                                    ? null
                                    : () {
                                        questionProvider.upvoteAnswer(
                                            widget.questionId, answer.id);
                                        setState(() {
                                          votesState[answer.id] = 1;
                                        });
                                      },
                                icon: const Icon(
                                  Icons.keyboard_arrow_up,
                                )),
                            Text(answer.votes.toString()),
                            IconButton(
                                onPressed: isDownvoted
                                    ? null
                                    : () {
                                        questionProvider.downvoteAnswer(
                                            widget.questionId, answer.id);
                                        setState(() {
                                          votesState[answer.id] = -1;
                                        });
                                      },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                )),
                          ]),
                          Expanded(
                            child: Text(
                              answer.content,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PostAnswerScreen(questionId: widget.questionId),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
