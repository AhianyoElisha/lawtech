import 'package:flutter/material.dart';

BoxDecoration appBoxDecorationTextField({
  Color color = Colors.white,
  double radius = 15,
  Color borderColor = Colors.black26 }) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor)
  );
}

BoxDecoration appBoxShadow({
  Color color = Colors.white,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1)
      )
    ]
  );
}