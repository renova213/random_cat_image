import 'dart:convert';

import 'package:random_cat/core/error/exception.dart';

import '../models/cat_model.dart';

import 'package:http/http.dart' as http;

abstract class CatRemoteDataSource {
  Future<CatModel> getRandomCatImage();
}

class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final http.Client client;
  CatRemoteDataSourceImpl({required this.client});
  @override
  Future<CatModel> getRandomCatImage() async {
    final response = await client.get(
      Uri.parse('https://api.thecatapi.com/v1/images/search'),
    );
    if (response.statusCode == 200) {
      return CatModel.fromJson(
        (json.decode(response.body) as List).first,
      );
    } else {
      throw ServerException();
    }
  }
}
