import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokeball/app/data/datasources/poke_data_source.dart';
import 'package:pokeball/app/data/repositoriesImpl/poke_repository_impl.dart';
import 'package:pokeball/app/domain/usecases/get_detail_usecase.dart';
import 'package:pokeball/app/domain/usecases/get_poke_usecase.dart';
import 'package:pokeball/app/domain/usecases/get_species_usecase.dart';
import 'package:pokeball/app/presentation/controller/home_controller.dart';

final getIt = GetIt.instance;

Future init() async {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => PokeDataSourceImpl(dio: getIt()));
  getIt.registerLazySingleton(() => PokeRepositoryImpl(dataSource: getIt()));
  getIt.registerLazySingleton(() => GetPokeUsecase(getIt()));
  getIt.registerLazySingleton(() => GetDetailUsecase(getIt()));
  getIt.registerLazySingleton(() => GetSpecialUsecase(getIt()));
  getIt.registerLazySingleton(() => HomeController(getIt(), getIt(), getIt()));
}
