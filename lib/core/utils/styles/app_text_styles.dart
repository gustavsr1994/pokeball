import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle small;
  final TextStyle normal;
  final TextStyle medium;
  final TextStyle large;

  AppTextStyles({
    required this.small,
    required this.normal,
    required this.medium,
    required this.large,
  });

  @override
  ThemeExtension<AppTextStyles> copyWith({
    TextStyle? small,
    TextStyle? normal,
    TextStyle? medium,
    TextStyle? large,
  }) {
    return AppTextStyles(
      small: small ?? this.small,
      normal: normal ?? this.normal,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    ThemeExtension<AppTextStyles>? other,
    double t,
  ) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      small: TextStyle.lerp(small, other.small, t)!,
      normal: TextStyle.lerp(normal, other.normal, t)!,
      medium: TextStyle.lerp(medium, other.medium, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }
}
