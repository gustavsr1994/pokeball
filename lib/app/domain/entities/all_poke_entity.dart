import 'package:equatable/equatable.dart';
import 'package:pokeball/app/domain/entities/detail_entity.dart';

class AllPokeEntity extends Equatable {
  final String name;
  final String url;
  DetailEntity? detail;
  AllPokeEntity({required this.name, required this.url, this.detail,});

  @override
  List<Object?> get props => [name, url, detail];
}
