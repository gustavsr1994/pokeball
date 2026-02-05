import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/core/utils/resource.dart';

abstract class PokeRepository {
  Future<Resource<List<AllPokeEntity>>> getAllPoke(int offset);
  // Future<Result> getDetailPoke(int id);
  // Future<Result> getEvolutionPoke(int id);
}