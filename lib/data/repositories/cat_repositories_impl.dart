import 'package:random_cat/data/datasources/cat_remote_data_source.dart';
import 'package:random_cat/domain/entities/cat.dart';
import 'package:random_cat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:random_cat/domain/repositories/cat_repositories.dart';

import '../../core/network_info.dart';

class CatRepositoriesImpl implements CatRepositories {
  final CatRemoteDataSource catRemoteDataSources;
  final NetworkInfo networkInfo;
  const CatRepositoriesImpl(
      {required this.catRemoteDataSources, required this.networkInfo});
  @override
  Future<Either<Failure, Cat>> getRandomCatImage() async {
    if (await networkInfo.isConnected) {
      final cat = await catRemoteDataSources.getRandomCatImage();
      return Right(cat);
    } else {
      throw const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }
}
