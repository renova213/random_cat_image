import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:random_cat/data/models/cat_model.dart';
import 'package:random_cat/domain/entities/cat.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const testCatModel = CatModel(
      urlImage: 'https://cdn2.thecatapi.com/images/1v6.jpg', id: '1v6');

  test('should be a subclass of Cat entity', () async {
    expect(testCatModel, isA<Cat>());
  });

  group('fromJson', () {
    test('should return valid model when the JSON urlImage is a string',
        () async {
      final List jsonMap = json.decode(
        fixture('the_cat_api.json'),
      );

      final result = CatModel.fromJson(jsonMap.first);
      expect(result, testCatModel);
    });
  });
}
