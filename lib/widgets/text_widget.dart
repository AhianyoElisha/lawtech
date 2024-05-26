import 'package:flutter/material.dart';
import 'package:lawtech/misc/colors.dart';

Widget textUnderline({text = "Your Text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: AppColors.textColor1,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.textColor1
      ),
    ),
  );
}