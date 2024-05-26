import 'package:flutter/material.dart';
import 'package:lawtech/misc/colors.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/app_text_large.dart';
import 'package:lawtech/widgets/widget_decorations.dart';

AppBar buildAppBar({String text = ""}) {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: AppTextLarge(text: text, color: AppColors.mainTextColor, size: 25,),
  );
}


Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20 ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("img/google.png"),
        _loginButton("img/apple.png"),
        _loginButton("img/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton( String imagePath) {
  return GestureDetector(
    child: Container(
      width: 40,
      height: 40,
      child: Image.asset(imagePath),
    ),
    onTap: () {},
  );
}

Widget appTextField({
  String text = "",
  String iconName = "",
  String hintText = "Type in your info",
  bool obsureText = false,
  void Function(String value)? func
}) {
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: text),
        const SizedBox(height: 5,),
        Container(
          height: 50,
          width: 335,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: appTextFieldImage(imagePath: iconName),
              ),
              Container(
                height: 50,
                width: 290,
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  onChanged: (value) => func!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent
                      )
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent
                        ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    )
                  ),
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obsureText,
              )
            )],
          ),
        )
      ],
    ),
  );
}




Widget appTextFieldImage({
  String imagePath = "img/profile.png",
  double height = 16,
  double width = 16
}) {
  return Image.asset(
      imagePath.isEmpty ? "img/profile.png": imagePath,
      height: height,
      width: width
  );
}