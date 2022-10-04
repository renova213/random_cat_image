import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String urlImage;
  final String id;
  const Cat({required this.urlImage, required this.id});
  @override
  List<Object?> get props => [urlImage, id];
}
