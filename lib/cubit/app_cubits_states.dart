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

class LoginState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignUpState extends CubitStates {
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

class SelectedVideoState extends CubitStates {
  SelectedVideoState(this.singleVideo, this.videos);
  final VideoData singleVideo;
  final List<VideoData> videos;

  @override
  List<Object?> get props => [singleVideo, videos];
}

class SelectedBookState extends CubitStates {
  SelectedBookState(this.singleBook, this.books);
  final Books singleBook;
  final List<Books> books;

  @override
  // TODO: implement props
  List<Object?> get props => [singleBook, books];

}

