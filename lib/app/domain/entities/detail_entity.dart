import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DetailEntity extends Equatable {
  Color color;
  String image;
  List<String> listType;
  String url;
  DetailEntity({
    required this.image,
    required this.listType,
    required this.color,
    required this.url,
  });

  @override
  List<Object?> get props => [image, listType, color, url];
}
