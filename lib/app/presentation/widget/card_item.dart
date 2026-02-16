import 'package:flutter/material.dart';
import 'package:pokeball/app/presentation/controller/home_controller.dart';
import 'package:pokeball/core/config/base/base_view.dart';
import 'package:pokeball/core/config/base/context_ext.dart';
import 'package:pokeball/core/utils/styles/text_style_ext.dart';

import '../../../core/utils/styles/color_pallete.dart';
import '../../domain/entities/all_poke_entity.dart';

class CardItem extends BaseWidget<HomeController> {
  final AllPokeEntity item;
  const CardItem(this.item, {super.key, required super.pageController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pageController.openDetail(item),
      child: Card(
        elevation: 5,
        color: item.detail!.color,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20 * pageController.scaleWidth,
            horizontal: 10 * pageController.scaleWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name.toUpperCase(),
                style: context.textStyles.medium.bold.withColor(
                  item.detail!.color == whiteColor ? grayColor : fontWhiteColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.detail!.listType
                        .map(
                          (element) => Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 3 * pageController.scaleWidth,
                              horizontal: 13 * pageController.scaleWidth,
                            ),
                            margin: EdgeInsets.only(
                              top: 5 * pageController.scaleWidth,
                            ),
                            decoration: BoxDecoration(
                              color: item.detail!.color,
                              border: Border.all(
                                color: item.detail!.color == whiteColor
                                    ? grayColor
                                    : fontWhiteColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Text(
                              element,
                              style: context.textStyles.small.bold.withColor(
                                item.detail!.color == whiteColor
                                    ? grayColor
                                    : fontWhiteColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Image.network(
                    item.detail!.image,
                    fit: BoxFit.cover,
                    height:
                        (pageController.isTablet ? 40 : 70) * pageController.scaleWidth,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
