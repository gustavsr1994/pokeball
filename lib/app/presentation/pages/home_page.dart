import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/core/config/base/base_view.dart';
import 'package:pokeball/core/config/base/context_ext.dart';
import 'package:pokeball/core/utils/styles/color_pallete.dart';
import 'package:pokeball/core/utils/styles/text_style_ext.dart';
import 'package:pokeball/core/utils/widgets/shimmer/text_shimmer.dart';

import '../controller/home_controller.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({super.key, required super.pageController});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<HomeController>(
      controller: pageController,
      builder: (context, controller) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10 * controller.scaleWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20 * controller.scaleWidth,
                    ),
                    child: Text(
                      "Pokedex",
                      style: context.textStyles.large.bold.withColor(
                        fontBlackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: PagingListener(
                      controller: controller.pagingController,
                      builder: (context, state, fetchNextPage) {
                        return PagedMasonryGridView<int, AllPokeEntity>(
                          state: state,
                          fetchNextPage: fetchNextPage,
                          showNoMoreItemsIndicatorAsGridChild: false,
                          showNewPageProgressIndicatorAsGridChild: false,
                          builderDelegate: PagedChildBuilderDelegate(
                            animateTransitions: true,
                            newPageProgressIndicatorBuilder: (context) =>
                                const TextShimmer(sizeFont: 30),
                            firstPageProgressIndicatorBuilder: (context) =>
                                Center(child: const TextShimmer(sizeFont: 30)),
                            noItemsFoundIndicatorBuilder: (context) => SizedBox(
                              height: controller.sizeHeight / 1.5,
                              child: Center(
                                child: Text(
                                  'Pokemon Not Found',
                                  style: context.textStyles.medium.withColor(
                                    blackColor,
                                  ),
                                ),
                              ),
                            ),
                            noMoreItemsIndicatorBuilder: (context) => SizedBox(
                              height: controller.sizeHeight / 7,
                              child: Center(
                                child: Text(
                                  "All Pokemon displayed",
                                  style: context.textStyles.medium.withColor(
                                    blackColor,
                                  ),
                                ),
                              ),
                            ),
                            itemBuilder: (context, item, index) {
                              return cardPoke(item);
                            },
                          ),
                          gridDelegateBuilder: (_) =>
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: controller.isTablet ? 3 : 2,
                              ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cardPoke(AllPokeEntity item) {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, controller) {
        return InkWell(
          onTap: () => controller.openDetail(item),
          child: Card(
            elevation: 5,
            color: item.detail!.color,
            margin: EdgeInsets.all(5),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20 * controller.scaleWidth,
                horizontal: 10 * controller.scaleWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toUpperCase(),
                    style: context.textStyles.medium.bold.withColor(
                      item.detail!.color == whiteColor
                          ? grayColor
                          : fontWhiteColor,
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
                                  vertical: 3 * controller.scaleWidth,
                                  horizontal: 13 * controller.scaleWidth,
                                ),
                                margin: EdgeInsets.only(
                                  top: 5 * controller.scaleWidth,
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
                            (controller.isTablet ? 40 : 70) *
                            controller.scaleWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
