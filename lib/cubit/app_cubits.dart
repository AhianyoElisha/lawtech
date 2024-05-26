import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lawtech/cubit/app_cubits_states.dart';
import 'package:lawtech/services/data_services.dart';

import '../models/data_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}): super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final videos;
  late final books;
  void getData() async {
    try {
      emit(LoadingState());
      videos = await data.getInfo();
      books = await data.getBooks();
      emit(LoadedState(videos, books));
    }
    catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  goToLogin() {
    emit(LoginState());
  }

  goToSignUp() {
    emit(SignUpState());
  }

  selectedVideo( VideoData video) {
    emit(SelectedVideoState(video, videos));
  }

  goHome() {
    emit(LoadedState(videos, books));
  }

  selectedBook( Books book) {
    emit(SelectedBookState(book, books));
  }
}