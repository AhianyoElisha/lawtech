import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/cubit/app_cubits_states.dart';
import 'package:lawtech/navigation/main_page.dart';
import 'package:lawtech/pages/onboarding_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is WelcomeState) {
            return OnboardingScreen();
          }
          if(state is LoadedState) {
            return MainPage();
          }
          if(state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
