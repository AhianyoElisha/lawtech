import 'package:equatable/equatable.dart';
import 'package:lawtech/models/data_model.dart';

abstract class CubitStates extends Equatable{}

class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadedState extends CubitStates {
  LoadedState(this.videos, this.books);
  final List<VideoData> videos;
  final List<Books> books;
  @override
  // TODO: implement props
  List<Object?> get props => [videos, books];

}

