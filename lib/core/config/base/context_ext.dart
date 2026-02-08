import 'package:flutter/material.dart';

import '../../utils/styles/app_text_styles.dart';

extension BuildContextExtensions on BuildContext {
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
  // ColorScheme get colors => Theme.of(this).colorScheme;
}