
import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  // Font weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  
  // Style
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  
  // Decoration
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  
  // Custom
  TextStyle withColor(Color color) => copyWith(color: color);
}