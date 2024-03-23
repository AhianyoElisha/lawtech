import 'package:flutter/material.dart';

class AppTextLarge extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppTextLarge({
        Key? key,
        this.size=28,
        required this.text,
        this.color = Colors.black87,
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
