import 'package:flutter/material.dart';
import 'package:lawtech/misc/colors.dart';
import 'package:lawtech/navigation/auth/signup.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/widget_decorations.dart';

Widget appButton({
  double width = 335,
  double height = 50,
  String buttonName = "",
  bool isLogin = true,
  bool border = false,
  void Function()? handleFinish
}) {
  return GestureDetector(
    onTap: handleFinish,
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.mainColor : Colors.white,
        border: border ? Border.all(color: AppColors.mainTextColor) : null
      ),
      child: Center(child: AppText(text: buttonName, color: isLogin ? Colors.white : AppColors.textColor1)),
    ),
  );
}