import 'package:flutter/material.dart';
import 'package:lawtech/Nani/Components/ChatBubble.dart';
import 'package:lawtech/Nani/Services/ChatProvider.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTyping);
  }

  void _handleTyping() {
    setState(() {
      _isTyping = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTyping);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Consumer<ChatProvider>(
            builder: (context, chatProvider, child) {
              return ListView.builder(
                reverse: true,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[chatProvider.messages.length - 1 - index];
                  return ChatBubble(
                    text: message.text,
                    isSentByMe: message.isSentByMe,
                    timestamp: message.timestamp,
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              _isTyping
                  ? IconButton(
                icon: Icon(Icons.send, color: Colors.blue),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    Provider.of<ChatProvider>(context, listen: false).sendMessage(_controller.text);
                    _controller.clear();
                  }
                },
              )
                  : Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.mic, color: Colors.blue),
                    onPressed: () {
                      // Add your microphone button logic here
                    },
                  ),
                  const SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.blue),
                    onPressed: () {
                      // Add your camera button logic here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;
  final DateTime timestamp;

  Message({required this.text, required this.isSentByMe, required this.timestamp});
}
