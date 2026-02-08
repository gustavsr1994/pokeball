
import 'package:pokeball/app/domain/entities/evolution_entity.dart';

import '../../../core/config/usecase/resource.dart';
import '../../../core/config/usecase/usecase.dart';
import '../../data/repositoriesImpl/poke_repository_impl.dart';

class GetEvolutionUsecase extends UseCase<List<EvolutionEntity>, String> {
  final PokeRepositoryImpl repository;
  GetEvolutionUsecase(this.repository);

  @override
  Future<Resource<List<EvolutionEntity>>> call(String param) =>
      repository.getEvolutionPoke(param);
}
