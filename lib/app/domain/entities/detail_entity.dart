import 'package:flutter/widgets.dart';

class DetailEntity {
  int id;
  String name;
  Color color;
  String image;
  List<String> listType;
  String url;
  String? eggGroup;
  String? eggCycle;
  num? height;
  num? weight;
  String? abilities;
  List<StatEntity>? listStats;
  List<String>? evolution;
  List<String>? moves;

  DetailEntity(
    this.id,
    this.name,
    this.image,
    this.listType,
    this.color,
    this.url, {
    this.eggGroup,
    this.eggCycle,
    this.height,
    this.weight,
    this.abilities,
    this.listStats,
    this.evolution,
    this.moves,
  });
}

class StatEntity {
  String label;
  num point;
  StatEntity({required this.label, required this.point});
}
