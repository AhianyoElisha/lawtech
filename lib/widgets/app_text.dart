import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  FontWeight weight;
  TextAlign textAlign;
  final Color color;
  final String text;
  AppText({
    Key? key,
    this.size=16,
    this.textAlign = TextAlign.left,
    this.weight=FontWeight.w400,
    required this.text,
    this.color = Colors.black54,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
