import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawtech/navigation/auth/signup.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/button_widgets.dart';
import 'package:lawtech/widgets/text_widget.dart';

import '../../cubit/app_cubits.dart';
import '../../widgets/login_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(text: "Log In"),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  thirdPartyLogin(),
                  Center(child: AppText(text: "Or use your email account to login")),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      appTextField(
                          text: "Email",
                          iconName: "img/email.png",
                          hintText: "Enter your email address",
                          obsureText: false,
                          func: (value) => {
                            print(value)
                          }
                      ),
                      const SizedBox(height: 20),
                      appTextField(
                          text: "Password",
                          iconName: "img/lock.png",
                          hintText: "Enter your password",
                          obsureText: true
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: textUnderline(text: "Forgot password?"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  appButton(
                      buttonName: "Login",
                      isLogin: true,
                      handleFinish: () => BlocProvider.of<AppCubits>(context).getData()
                  ),
                  const SizedBox(height: 20),
                  appButton(
                      buttonName: "Register",
                      isLogin: false,
                      border: true,
                      handleFinish: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp())) 
                  ),
                ],
              ),
            ),
          ),
      )
    );
  }
}
