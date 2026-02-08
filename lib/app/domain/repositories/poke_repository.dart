import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/app/domain/entities/detail_entity.dart';
import 'package:pokeball/core/config/usecase/resource.dart';

import '../entities/evolution_entity.dart';
import '../entities/species_entity.dart';

abstract class PokeRepository {
  Future<Resource<List<AllPokeEntity>>> getAllPoke(int offset);
  Future<Resource<DetailEntity>> getDetailPoke(String url);
  Future<Resource<SpeciesEntity>> getSpeciesPoke(String url);
  Future<Resource<List<EvolutionEntity>>> getEvolutionPoke(String url);
}