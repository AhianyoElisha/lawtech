import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lawtech/cubit/app_cubit_logics.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/navigation/main_page.dart';
import 'package:lawtech/pages/onboarding_screen.dart';
import 'package:lawtech/services/data_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

void main() async {
  await dotenv.dotenv.load();
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
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
            data:DataServices()
        ),
        child: const AppCubitLogics(),
      ),
    );
  }
}

