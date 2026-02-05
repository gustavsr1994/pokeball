import 'package:equatable/equatable.dart';

class AllPokeEntity extends Equatable {
  final String name;
  final String image;
  final List<String> listType;
  const AllPokeEntity({
    required this.name,
    required this.image,
    required this.listType,
  });
  
  @override
  List<Object?> get props => [name, image, listType];
}
