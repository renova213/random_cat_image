import 'package:random_cat/core/error/exception.dart';
import 'package:random_cat/data/datasources/cat_remote_data_source.dart';
import 'package:random_cat/domain/entities/cat.dart';
import 'package:random_cat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:random_cat/domain/repositories/cat_repositories.dart';

class CatRepositoriesImpl implements CatRepositories {
  final CatRemoteDataSource catRemoteDataSources;
  const CatRepositoriesImpl({required this.catRemoteDataSources});
  @override
  Future<Either<Failure, Cat>> getRandomCatImage() async {
    try {
      final remoteCat = await catRemoteDataSources.getRandomCatImage();
      return Right(remoteCat);
    } on ServerException {
      return const Left(ServerFailure(message: "can't connect to server"));
    }
  }
}
