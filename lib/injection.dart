import 'package:get_it/get_it.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:random_cat/core/network_info.dart';
import 'package:random_cat/data/datasources/cat_remote_data_source.dart';
import 'package:random_cat/data/repositories/cat_repositories_impl.dart';
import 'package:random_cat/domain/repositories/cat_repositories.dart';
import 'package:random_cat/domain/usecases/get_random_cat_image.dart';
import 'package:random_cat/presentation/bloc/cat_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CatBloc(getRandomCatImage: sl()));

  sl.registerLazySingleton(() => GetRandomCatImage(catRepositories: sl()));

  sl.registerLazySingleton<CatRepositories>(
      () => CatRepositoriesImpl(catRemoteDataSources: sl()));

  // sl.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<CatRemoteDataSource>(
      () => CatRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton(() => http.Client());

  // sl.registerLazySingleton(() => InternetConnectionChecker());
}
