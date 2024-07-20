

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawtech/Nani/Chat/Component/body.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.person, color: Colors.grey),
          onPressed: (){},
        ),
      ),
      body: Body(),
      backgroundColor: Colors.white,
    );
  }
}