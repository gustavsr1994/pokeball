import 'package:flutter/material.dart';
import 'package:pokeball/core/utils/styles/color_pallete.dart';
import 'package:shimmer/shimmer.dart';

class TextShimmer extends StatelessWidget {
  final String textMessage;
  final double sizeFont;
  const TextShimmer({
    this.textMessage = 'Please Wait',
    this.sizeFont = 20.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: primaryColor,
      highlightColor: accentColor,
      child: Text(
        textMessage,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: sizeFont),
      ),
    );
  }
}
