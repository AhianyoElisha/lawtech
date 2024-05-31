import 'package:flutter/material.dart';
import 'package:lawtech/provider/question_provider.dart';
import 'package:lawtech/navigation/qa/post_question_screen.dart';
import 'package:lawtech/navigation/qa/question_detail_screen.dart';
import 'package:provider/provider.dart';

class QAForumPage extends StatefulWidget {
  const QAForumPage({super.key});

  @override
  State<QAForumPage> createState() => _QAForumPageState();
}

class _QAForumPageState extends State<QAForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q&A Section"),
      ),
      body: Consumer<QuestionProvider>(
        builder: (context, questionProvider, _) {
          return ListView.builder(
            itemCount: questionProvider.questions.length,
            itemBuilder: (context, index) {
              final question = questionProvider.questions[index];
              return ListTile(
                title: Text(question.title),
                subtitle: Text(question.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuestionDetailScreen(questionId: question.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostQuestionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
