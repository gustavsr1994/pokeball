import 'package:pokeball/core/config/usecase/usecase.dart';
import 'package:pokeball/core/config/usecase/resource.dart';

import '../../data/repositoriesImpl/poke_repository_impl.dart';
import '../entities/detail_entity.dart';

class GetDetailUsecase extends UseCase<DetailEntity, String> {
  final PokeRepositoryImpl repository;
  GetDetailUsecase(this.repository);

  @override
  Future<Resource<DetailEntity>> call(String param) =>
      repository.getDetailPoke(param);
}
