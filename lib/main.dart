import 'package:flutter/material.dart';
import 'package:lawtech/navigation/main_page.dart';
import 'package:lawtech/pages/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  Colors.blue,
        useMaterial3: true,
        fontFamily: 'OneUI6'
      ),
      home: OnboardingScreen(),
    );
  }
}

