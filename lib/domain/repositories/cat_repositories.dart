import 'package:dartz/dartz.dart';
import 'package:random_cat/core/error/failure.dart';
import 'package:random_cat/domain/entities/cat.dart';

abstract class CatRepositories {
  Future<Either<Failure, Cat>> getRandomCatImage();
}
