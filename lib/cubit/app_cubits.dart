import 'package:bloc/bloc.dart';
import 'package:lawtech/cubit/app_cubits_states.dart';
import 'package:lawtech/services/data_services.dart';

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

    }
  }
}