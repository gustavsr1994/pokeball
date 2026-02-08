import 'package:flutter/material.dart';
import 'package:pokeball/app/data/datasources/poke_data_source.dart';
import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/app/domain/entities/detail_entity.dart';
import 'package:pokeball/app/domain/entities/species_entity.dart';
import 'package:pokeball/app/domain/repositories/poke_repository.dart';
import 'package:pokeball/core/config/usecase/resource.dart';
import 'package:pokeball/core/utils/styles/color_pallete.dart';
import 'package:pokeball/core/utils/styles/constant_color_type.dart';

import '../../../core/config/error/exceptions.dart';

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
        image: result.sprites!.other!.home!.frontDefault!,
        listType: result.types!.map((e) => e.type!.name!).toList(),
        color: whiteColor,
        url: result.species!.url!,
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
      var data = SpeciesEntity(color: result.color!.name!);
      return Resource.success(data);
    } on ServerException catch (e) {
      return Resource.error(e.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }
}
