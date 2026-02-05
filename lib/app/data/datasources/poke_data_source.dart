import 'package:dio/dio.dart';
import 'package:pokeball/app/data/models/poke_evolution_response.dart';
import 'package:pokeball/core/error/exceptions.dart';
import 'package:pokeball/core/utils/constant.dart';

import '../models/poke_all_response.dart';
import '../models/poke_detail_response.dart';

abstract class PokeDataSource {
  Future<List<DataPoke>> fetchAllPoke(int offset);
  Future<PokeDetailResponse> fetchDetailPoke(int id);
  Future<PokeEvolutionResponse> fetchEvolutionPoke(int id);
}

class PokeDataSourceImpl implements PokeDataSource {
  Dio dio;
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
  Future<PokeDetailResponse> fetchDetailPoke(int id) async {
    try {
      final response = await dio.get('${apiEndpoint}pokemon/$id');
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
  Future<PokeEvolutionResponse> fetchEvolutionPoke(int id) async {
    try {
      final response = await dio.get('${apiEndpoint}evolution-chain/$id');
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
}
