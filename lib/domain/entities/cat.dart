import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String urlImage;
  const Cat({required this.urlImage});
  @override
  List<Object?> get props => [];
}
