import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final DateTime timestamp;

  ChatBubble({required this.text, required this.isSentByMe, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}", // Format the time as needed
              style: TextStyle(
                color: isSentByMe ? Colors.white70 : Colors.black54,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}