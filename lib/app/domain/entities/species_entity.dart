import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class SpeciesEntity extends Equatable {
  final String color;
  const SpeciesEntity({
    required this.color
  });

  @override
  List<Object?> get props => [color];
}
