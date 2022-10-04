import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_cat/core/error/failure.dart';
import 'package:random_cat/domain/entities/cat.dart';
import 'package:random_cat/domain/usecases/get_random_cat_image.dart';
import 'package:random_cat/presentation/bloc/cat_bloc.dart';

import 'cat_bloc_test.mocks.dart';

@GenerateMocks([GetRandomCatImage])
void main() {
  MockGetRandomCatImage mockGetRandomCatImage = MockGetRandomCatImage();

  CatBloc bloc = CatBloc(getRandomCatImage: mockGetRandomCatImage);

  group('GetCatFromRandomImage', () {
    const testCat =
        Cat(urlImage: 'https://cdn2.thecatapi.com/images/1v6.jpg', id: '1v6');

    blocTest<CatBloc, CatState>(
      'should get data from the random use case',
      build: () {
        when(mockGetRandomCatImage())
            .thenAnswer((_) async => const Right(testCat));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(GetCatFromRandomImage());
        await untilCalled(mockGetRandomCatImage());
      },
      verify: (_) => mockGetRandomCatImage(),
    );

    blocTest<CatBloc, CatState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetRandomCatImage())
            .thenAnswer((_) async => const Right(testCat));
        return bloc;
      },
      act: (bloc) async => bloc.add(GetCatFromRandomImage()),
      expect: () => [Loading(), const Loaded(cat: testCat)],
    );

    blocTest<CatBloc, CatState>(
      'should emit [Loading, Error] when getting data fails',
      build: () {
        when(mockGetRandomCatImage()).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'ServerFailure')));
        return bloc;
      },
      act: (bloc) async => bloc.add(GetCatFromRandomImage()),
      expect: () => [Loading(), const Error(errorMessage: 'ServerFailure')],
    );
  });
}
