import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_cat/core/error/exception.dart';
import 'package:random_cat/core/error/failure.dart';
import 'package:random_cat/data/datasources/cat_remote_data_source.dart';
import 'package:random_cat/data/models/cat_model.dart';
import 'package:random_cat/data/repositories/cat_repositories_impl.dart';

import 'cat_repositories_impl_test.mocks.dart';

@GenerateMocks([CatRemoteDataSource])
void main() {
  MockCatRemoteDataSource mockCatRemoteDataSource = MockCatRemoteDataSource();
  CatRepositoriesImpl repository =
      CatRepositoriesImpl(catRemoteDataSources: mockCatRemoteDataSource);

  const testCatModel = CatModel(
      urlImage: 'https://api.thecatapi.com/v1/images/search', id: '1v6');
  group('Get random cat', () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockCatRemoteDataSource.getRandomCatImage())
          .thenAnswer((_) async => testCatModel);

      final result = await repository.getRandomCatImage();

      verify(mockCatRemoteDataSource.getRandomCatImage());

      expect(result, equals(const Right(testCatModel)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessfull',
        () async {
      when(mockCatRemoteDataSource.getRandomCatImage())
          .thenThrow(ServerException());

      final result = await repository.getRandomCatImage();

      verify(mockCatRemoteDataSource.getRandomCatImage());

      expect(
          result,
          equals(
              const Left(ServerFailure(message: "can't connect to server"))));
    });
  });
}
