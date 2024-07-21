import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawtech/Nani/Chat/Component/body.dart';

class ChatProvider with ChangeNotifier {
  List<Message> _messages = [
    Message(text: 'Hi there!', isSentByMe: false, timestamp: DateTime.now()),
  ];

  List<Message> _predefinedMessages = [
    Message(text: 'Hello! How are you?', isSentByMe: false, timestamp: DateTime.now()),
    Message(text: 'Hello! Des?', isSentByMe: false, timestamp: DateTime.now()),
    Message(text: 'Hello! How are you?', isSentByMe: false, timestamp: DateTime.now()),
  ];

  List<Message> get messages => _messages;

  void sendMessage(String text) {
    _messages.add(Message(text: text, isSentByMe: true, timestamp: DateTime.now()));
    notifyListeners();
    _showLoadingIndicator();
  }

  void _showLoadingIndicator() {
    _messages.add(Message(text: '...', isSentByMe: false, timestamp: DateTime.now()));
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1000), _displayNextPredefinedMessage);
  }

  void _displayNextPredefinedMessage() {
    if (_predefinedMessages.isNotEmpty) {
      // Remove the loading indicator
      _messages.removeLast();
      // Add the next predefined message
      _messages.add(_predefinedMessages.removeAt(0));
      notifyListeners();
    }
  }
}

