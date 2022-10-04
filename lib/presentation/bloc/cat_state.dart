part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class Empty extends CatState {}

class Loading extends CatState {}

class Loaded extends CatState {
  final Cat? cat;

  const Loaded({this.cat});
}

class Error extends CatState {
  final String? errorMessage;

  const Error({this.errorMessage});
}
