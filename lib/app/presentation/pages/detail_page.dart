import 'package:flutter/material.dart';
import 'package:pokeball/app/presentation/controller/detail_controller.dart';
import 'package:pokeball/app/presentation/widget/bodyDetail/body_about.dart';
import 'package:pokeball/core/config/base/base_view.dart';
import 'package:pokeball/core/config/base/context_ext.dart';
import 'package:pokeball/core/utils/misc/constant.dart';
import 'package:pokeball/core/utils/styles/color_pallete.dart';
import 'package:pokeball/core/utils/styles/text_style_ext.dart';
import 'package:pokeball/core/utils/widgets/shimmer/text_shimmer.dart';

import '../../domain/entities/all_poke_entity.dart';

class DetailPage extends BasePage<DetailController> {
  final AllPokeEntity data;
  DetailPage({super.key, required super.pageController, required this.data}) {
    pageController.initialPage(data);
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<DetailController>(
      controller: pageController,
      builder: (context, controller) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: controller.detailEntity!.detail!.color,
              leading: BackButton(color: fontWhiteColor),
              title: Text(
                controller.detailEntity!.name.toUpperCase(),
                style: context.textStyles.large.bold.withColor(fontWhiteColor),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '#00${controller.detailEntity!.detail!.id}',
                    style: context.textStyles.large.withColor(fontWhiteColor),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  height: controller.sizeHeight,
                  width: controller.sizeWidth,
                  color: controller.detailEntity!.detail!.color,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20 * controller.scaleWidth,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.detailEntity!.detail!.listType
                          .map(
                            (element) => Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 3 * controller.scaleWidth,
                                horizontal: 13 * controller.scaleWidth,
                              ),
                              margin: EdgeInsets.only(
                                top: 5 * controller.scaleWidth,
                                right: 10 * controller.scaleWidth,
                              ),
                              decoration: BoxDecoration(
                                color: controller.detailEntity!.detail!.color,
                                border: Border.all(
                                  color:
                                      controller.detailEntity!.detail!.color ==
                                          whiteColor
                                      ? grayColor
                                      : fontWhiteColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: Text(
                                element,
                                style: context.textStyles.medium.bold.withColor(
                                  controller.detailEntity!.detail!.color ==
                                          whiteColor
                                      ? grayColor
                                      : fontWhiteColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height:
                        controller.sizeHeight /
                        (controller.isTablet ? 1.8 : 1.5),
                    width: controller.sizeWidth,
                    padding: EdgeInsets.only(
                      top:
                          (controller.isTablet ? 20 : 80) *
                          controller.scaleWidth,
                    ),
                    decoration: BoxDecoration(
                      color: fontWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          onTap: (value) => controller.actionTap(value),
                          tabs: nameTab
                              .map((element) => Tab(text: element))
                              .toList(),
                        ),
                        Container(
                          height: controller.sizeHeight / 2,
                          child: bodyWidget(controller.label))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom:
                      controller.sizeHeight / (controller.isTablet ? 2 : 1.7),
                  right: controller.sizeWidth / (controller.isTablet ? 3.5 : 6),
                  child: Center(
                    child: Image.network(
                      controller.detailEntity!.detail!.image,
                      fit: BoxFit.cover,
                      height:
                          (controller.isTablet ? 150 : 250) *
                          controller.scaleWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
Widget bodyWidget(String nameTab){
  switch (nameTab) {
    case "About":
      return BodyAbout(pageController: pageController);
    default:
      return Text(nameTab);
  }

}
}
