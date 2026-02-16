import 'package:flutter/material.dart';
import 'package:pokeball/app/presentation/controller/detail_controller.dart';
import 'package:pokeball/core/config/base/base_view.dart';
import 'package:pokeball/core/config/base/context_ext.dart';
import 'package:pokeball/core/utils/styles/color_pallete.dart';
import 'package:pokeball/core/utils/styles/text_style_ext.dart';

class BodyAbout extends BaseWidget<DetailController> {
  const BodyAbout({super.key, required super.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        shrinkWrap: true,
        children: [
          childData(
            "Height",
            '${pageController.detailEntity!.detail!.height} cm',
            context,
          ),
          childData(
            "Weight",
            '${pageController.detailEntity!.detail!.weight} cm',
            context,
          ),
          childData(
            "Abilities",
            pageController.detailEntity!.detail!.abilities!.toUpperCase(),
            context,
          ),
          SizedBox(height: 10 * pageController.scaleWidth),
          ListTile(
            title: Text(
              'Breeding',
              style: context.textStyles.large.bold.withColor(blackColor),
            ),
          ),
          childData(
            "Egg Groups",
            pageController.speciesEntity!.eggGroup.first,
            context,
          ),childData(
            "Egg Cycle",
            pageController.detailEntity!.detail!.eggCycle!,
            context,
          ),
          // ListTile(
          //   title: Text(
          //     "Height",
          //     style: context.textStyles.normal.bold.withColor(grayColor),
          //   ),
          //   subtitle: Text(
          //     '${pageController.detailEntity!.detail!.height} cm',
          //     style: context.textStyles.medium.bold.withColor(blackColor),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget childData(String header, String child, BuildContext context) {
    return ListTile(
      title: Text(
        header,
        style: context.textStyles.normal.bold.withColor(grayColor),
      ),
      subtitle: Text(
        child,
        style: context.textStyles.medium.bold.withColor(blackColor),
      ),
    );
  }
}
