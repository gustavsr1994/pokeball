import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokeball/app/data/datasources/poke_data_source.dart';
import 'package:pokeball/app/data/repositoriesImpl/poke_repository_impl.dart';

final getIt = GetIt.instance;

Future init() async {
  // getIt.registerLazySingleton(() => PokeRepositoryImpl(dataSource: getIt()),);
  getIt.registerLazySingleton(() => PokeRepositoryImpl(dataSource: getIt()),);
  getIt.registerLazySingleton(() => PokeDataSourceImpl(dio: getIt()),);
  getIt.registerLazySingleton(() => Dio(),);
}
