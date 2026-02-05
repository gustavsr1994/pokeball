import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/core/usecase/usecase.dart';
import 'package:pokeball/core/utils/resource.dart';

import '../repositories/poke_repository.dart';

class GetPokeUsecase extends UseCase<List<AllPokeEntity>, int> {
  final PokeRepository repository;
  GetPokeUsecase(this.repository);

  @override
  Future<Resource<List<AllPokeEntity>>> call(int param) =>
      repository.getAllPoke(param);
}
