import 'package:pokeball/app/data/datasources/poke_data_source.dart';
import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/app/domain/repositories/poke_repository.dart';
import 'package:pokeball/core/config/usecase/resource.dart';

import '../../../core/config/error/exceptions.dart';

class PokeRepositoryImpl implements PokeRepository {
  final PokeDataSource dataSource;
  PokeRepositoryImpl({required this.dataSource});

  @override
  Future<Resource<List<AllPokeEntity>>> getAllPoke(int offset) async {
    try {
      List<AllPokeEntity> listData = [];
      var result = await dataSource.fetchAllPoke(offset);
      for (var element in result) {
        listData.add(
          AllPokeEntity(name: element.name!, image: '-', listType: []),
        );
      }
      return Resource.success(listData);
    } on ServerException catch (e) {
      return Resource.error(e.message, []);
    } catch (e) {
      return Resource.error(e.toString(), []);
    }
  }
}
