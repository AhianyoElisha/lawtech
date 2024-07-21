import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawtech/provider/question_provider.dart';
import 'package:lawtech/cubit/app_cubit_logics.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/services/data_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:lawtech/utils/app_bar_styles.dart';
import 'package:provider/provider.dart';

import 'Nani/Services/ChatProvider.dart';

void main() async {
  await dotenv.dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => QuestionProvider())),
        ChangeNotifierProvider(create: ((_) => ChatProvider())),
      ],
      child: MaterialApp(
        title: 'Lawtech',

        debugShowCheckedModeBanner: false,
        theme: AppTheme.appThemeData,
        // ThemeData(
        //   primarySwatch:  Colors.blue,
        //   useMaterial3: true,
        //   fontFamily: 'OneUI6'
        // ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: const AppCubitLogics(),
        ),
      ),
    );
  }
}
