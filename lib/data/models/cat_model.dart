import 'package:random_cat/domain/entities/cat.dart';

class CatModel extends Cat {
  const CatModel({required super.urlImage});

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      CatModel(urlImage: json['url']);
}
