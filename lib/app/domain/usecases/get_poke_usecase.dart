import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/core/config/usecase/usecase.dart';
import 'package:pokeball/core/config/usecase/resource.dart';

import '../../data/repositoriesImpl/poke_repository_impl.dart';

class GetPokeUsecase extends UseCase<List<AllPokeEntity>, int> {
  final PokeRepositoryImpl repository;
  GetPokeUsecase(this.repository);

  @override
  Future<Resource<List<AllPokeEntity>>> call(int param) =>
      repository.getAllPoke(param);
}
