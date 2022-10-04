import 'package:dartz/dartz.dart';
import 'package:random_cat/domain/entities/cat.dart';
import 'package:random_cat/domain/repositories/cat_repositories.dart';

import '../../core/error/failure.dart';

class GetRandomCatImage {
  final CatRepositories catRepositories;

  const GetRandomCatImage({required this.catRepositories});
  Future<Either<Failure, Cat>> call() async =>
      await catRepositories.getRandomCatImage();
}
