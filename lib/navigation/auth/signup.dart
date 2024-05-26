import 'package:flutter/material.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/button_widgets.dart';
import 'package:lawtech/widgets/text_widget.dart';

import '../../widgets/login_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(text: "Sign Up"),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Center(
                      child: AppText(text: "Enter your details below to sign up")
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      appTextField(
                          text: "Username",
                          iconName: "img/profile.png",
                          hintText: "Enter your username",
                          obsureText: false
                      ),
                      const SizedBox(height: 20),
                      appTextField(
                          text: "Email",
                          iconName: "img/email.png",
                          hintText: "Enter your email address",
                          obsureText: true
                      ),
                      const SizedBox(height: 20),
                      appTextField(
                          text: "Password",
                          iconName: "img/lock.png",
                          hintText: "Enter your password",
                          obsureText: true
                      ),
                      const SizedBox(height: 20),
                      appTextField(
                          text: "Confirm password",
                          iconName: "img/lock.png",
                          hintText: "Re-enter your password",
                          obsureText: true
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 335,
                        child: AppText(
                            text: "By creating an account you agree with our terms and conditions.",
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  appButton(buttonName: "Sign Up", isLogin: true, border: true),
                ],
              ),
            ),
          ),
        )
    );
  }
}
