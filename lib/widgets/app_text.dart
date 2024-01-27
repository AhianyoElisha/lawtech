import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppText({
    Key? key,
    this.size=16,
    required this.text,
    this.color = Colors.black45,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
