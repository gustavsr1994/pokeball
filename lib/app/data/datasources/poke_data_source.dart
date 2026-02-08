import 'package:dio/dio.dart';
import 'package:pokeball/app/data/models/poke_evolution_response.dart';
import 'package:pokeball/core/config/error/exceptions.dart';
import 'package:pokeball/core/utils/misc/constant.dart';

import '../models/poke_all_response.dart';
import '../models/poke_detail_response.dart';
import '../models/poke_species_response.dart';

abstract class PokeDataSource {
  Future<List<DataPoke>> fetchAllPoke(int offset);
  Future<PokeDetailResponse> fetchDetailPoke(String url);
  Future<PokeEvolutionResponse> fetchEvolutionPoke(String url);
  Future<PokeSpeciesResponse> fetchSpeciesPoke(String url);
}

class PokeDataSourceImpl implements PokeDataSource {
  final Dio dio;
  PokeDataSourceImpl({required this.dio});

  @override
  Future<List<DataPoke>> fetchAllPoke(int offset) async {
    try {
      final response = await dio.get(
        '${apiEndpoint}pokemon',
        queryParameters: {'offset': offset, 'limit': 10},
      );
      if (response.statusCode == 200) {
        var result = PokeAllResponse.fromJson(response.data);
        return result.results ?? [];
      } else {
        throw ServerException(response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PokeDetailResponse> fetchDetailPoke(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var result = PokeDetailResponse.fromJson(response.data);
        return result;
      } else {
        throw ServerException(response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PokeEvolutionResponse> fetchEvolutionPoke(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var result = PokeEvolutionResponse.fromJson(response.data);
        return result;
      } else {
        throw ServerException(response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PokeSpeciesResponse> fetchSpeciesPoke(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var result = PokeSpeciesResponse.fromJson(response.data);
        return result;
      } else {
        throw ServerException(response.statusMessage!);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
