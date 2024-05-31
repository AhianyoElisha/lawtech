import 'package:flutter/material.dart';
import 'package:lawtech/provider/question_provider.dart';
import 'package:provider/provider.dart';

class PostAnswerScreen extends StatelessWidget {
  PostAnswerScreen({super.key, required this.questionId});
  final String questionId;

  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Answer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String content = answerController.text;
                Provider.of<QuestionProvider>(context, listen: false)
                    .addAnswer(questionId, content);
                Navigator.pop(context);
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
