import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:random_cat/core/error/exception.dart';
import 'package:random_cat/data/datasources/cat_remote_data_source.dart';
import 'package:random_cat/data/models/cat_model.dart';

import '../../fixtures/fixture_reader.dart';
import 'cat_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  MockHttpClient mockHttpClient = MockHttpClient();
  CatRemoteDataSourceImpl dataSource =
      CatRemoteDataSourceImpl(client: mockHttpClient);

  final List sourceJson = json.decode(fixture('the_cat_api.json'));

  CatModel testCatModel = CatModel.fromJson(sourceJson.first);

  void setUpMockHttpStatusCode200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('the_cat_api.json'), 200));
  }

  void setUpMockHttpStatusCode404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('get random cat image', () {
    test('should return Cat when response code is ', () async {
      setUpMockHttpStatusCode200();

      final result = await dataSource.getRandomCatImage();

      verify(mockHttpClient.get(
          Uri.parse('https://api.thecatapi.com/v1/images/search'),
          headers: {'Content-Type': 'application/json'}));

      expect(result, equals(testCatModel));
    });

    test('should throw serverException when the response 404 or other than 200',
        () async {
      setUpMockHttpStatusCode404();

      final call = dataSource.getRandomCatImage;

      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
