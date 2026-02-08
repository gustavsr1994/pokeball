import 'package:pokeball/app/domain/entities/species_entity.dart';
import 'package:pokeball/core/config/usecase/usecase.dart';
import 'package:pokeball/core/config/usecase/resource.dart';

import '../../data/repositoriesImpl/poke_repository_impl.dart';

class GetSpecialUsecase extends UseCase<SpeciesEntity, String> {
  final PokeRepositoryImpl repository;
  GetSpecialUsecase(this.repository);

  @override
  Future<Resource<SpeciesEntity>> call(String param) =>
      repository.getSpeciesPoke(param);
}
