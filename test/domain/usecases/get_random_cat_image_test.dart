import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_cat/domain/entities/cat.dart';
import 'package:random_cat/domain/repositories/cat_repositories.dart';
import 'package:random_cat/domain/usecases/get_random_cat_image.dart';

import 'get_random_cat_image_test.mocks.dart';

@GenerateMocks([CatRepositories])
void main() {
  MockCatRepositories mockCatRepositories = MockCatRepositories();
  GetRandomCatImage usecase =
      GetRandomCatImage(catRepositories: mockCatRepositories);

  const testCat = Cat(urlImage: 'https://cdn2.thecatapi.com/images/1v6.jpg');

  test('should get cat from the repository', () async {
    when(mockCatRepositories.getRandomCatImage())
        .thenAnswer((_) async => const Right(testCat));

    final result = await usecase();

    expect(result, const Right(testCat));

    verify(mockCatRepositories.getRandomCatImage());
  });
}
