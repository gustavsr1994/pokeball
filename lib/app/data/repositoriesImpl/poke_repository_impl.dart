import 'package:flutter/material.dart';
import 'package:pokeball/app/data/datasources/poke_data_source.dart';
import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/app/domain/entities/detail_entity.dart';
import 'package:pokeball/app/domain/entities/evolution_entity.dart';
import 'package:pokeball/app/domain/entities/species_entity.dart';
import 'package:pokeball/app/domain/repositories/poke_repository.dart';
import 'package:pokeball/core/config/usecase/resource.dart';
import 'package:pokeball/core/utils/styles/color_pallete.dart';
import 'package:pokeball/core/utils/styles/constant_color_type.dart';

import '../../../core/config/error/exceptions.dart';
import '../models/poke_evolution_response.dart';

class PokeRepositoryImpl implements PokeRepository {
  final PokeDataSourceImpl dataSource;
  PokeRepositoryImpl({required this.dataSource});

  @override
  Future<Resource<List<AllPokeEntity>>> getAllPoke(int offset) async {
    try {
      List<AllPokeEntity> listData = [];
      var result = await dataSource.fetchAllPoke(offset);
      for (var element in result) {
        listData.add(AllPokeEntity(name: element.name!, url: element.url!));
      }
      return Resource.success(listData);
    } on ServerException catch (e) {
      return Resource.error(e.message, []);
    } catch (e) {
      return Resource.error(e.toString(), []);
    }
  }

  @override
  Future<Resource<DetailEntity>> getDetailPoke(String url) async {
    try {
      var result = await dataSource.fetchDetailPoke(url);
      var data = DetailEntity(
        result.id!,
        result.name!,
        result.sprites!.other!.home!.frontDefault!,
        result.types!.map((e) => e.type!.name!).toList(),
        whiteColor,
        result.species!.url!,
        height: result.height! / 10,
        weight: result.weight! / 10,
        abilities: result.abilities!
            .where((element) => element.isHidden == false)
            .map((e) => e.ability!.name!)
            .toList()
            .reduce((value, element) => '$value,$element'),
        listStats: result.stats!
            .map(
              (element) => StatEntity(
                label: element.stat!.name!,
                point: element.baseStat!,
              ),
            )
            .toList(),
        moves: result.moves!.map((element) => element.move!.name!).toList(),
        eggCycle: result.types!.first.type!.name,
        eggGroup: '',
        evolution: [],
      );
      return Resource.success(data);
    } on ServerException catch (e) {
      return Resource.error(e.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  @override
  Future<Resource<SpeciesEntity>> getSpeciesPoke(String url) async {
    try {
      var result = await dataSource.fetchSpeciesPoke(url);
      var data = SpeciesEntity(
        color: result.color!.name!,
        eggGroup: result.eggGroups!.map((element) => element.name!).toList(),
        url: result.evolutionChain!.url!,
      );
      return Resource.success(data);
    } on ServerException catch (e) {
      return Resource.error(e.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  @override
  Future<Resource<List<EvolutionEntity>>> getEvolutionPoke(String url) async {
    try {
      List<EvolutionEntity> listData = [];
      var result = await dataSource.fetchEvolutionPoke(url);
      var chain = result.chain!;
      listData.add(
        EvolutionEntity(
          evolution: chain.species!.name!,
          url: chain.species!.url!,
        ),
      );
      for (var item in chain.evolvesTo!) {
        listData.add(
          EvolutionEntity(
            evolution: item.species!.name!,
            url: item.species!.url!,
          ),
        );
        for (var itemSecond in item.evolvesTo!) {
          listData.add(
            EvolutionEntity(
              evolution: itemSecond.species!.name!,
              url: itemSecond.species!.url!,
            ),
          );
        }
      }
      return Resource.success(listData);
    } on ServerException catch (e) {
      return Resource.error(e.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }
}
