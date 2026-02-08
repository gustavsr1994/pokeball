import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokeball/app/domain/entities/all_poke_entity.dart';
import 'package:pokeball/app/domain/usecases/get_detail_usecase.dart';
import 'package:pokeball/app/domain/usecases/get_poke_usecase.dart';
import 'package:pokeball/app/domain/usecases/get_species_usecase.dart';
import 'package:pokeball/app/presentation/pages/detail_page.dart';
import 'package:pokeball/core/config/base/base_controller.dart';
import 'package:pokeball/core/utils/styles/constant_color_type.dart';

import '../../domain/entities/detail_entity.dart';

class HomeController extends BaseController {
  GetPokeUsecase getPokeUsecase;
  GetDetailUsecase getDetailUsecase;
  GetSpecialUsecase getSpecialUsecase;
  HomeController(
    this.getPokeUsecase,
    this.getDetailUsecase,
    this.getSpecialUsecase,
  );

  late final pagingController = PagingController<int, AllPokeEntity>(
    getNextPageKey: (state) =>
        state.hasNextPage ? (state.keys?.last ?? 0) + 1 : null,
    fetchPage: (pageKey) => loadAllPoke(pageKey),
  );

  @override
  void onInitState() {
    super.onInitState();
    pagingController.refresh();
  }

  Future<List<AllPokeEntity>> loadAllPoke(int pages) async {
    pages = pages <= 1 ? 0 : (pages - 1) * 10;
    List<AllPokeEntity> listData = [];
    var result = await getPokeUsecase.call(pages);

    if (result.data!.isNotEmpty) {
      for (var element in result.data!) {
        var detail = await getDetailUsecase.call(element.url);
        var species = await getSpecialUsecase.call(detail.data!.url);

        var color =
            colorType
                    .where((item) => item['name'] == species.data!.color)
                    .last['color']
                as Color;
        listData.add(
          AllPokeEntity(
            name: element.name,
            url: element.url,
            detail: DetailEntity(
              detail.data!.id,
              detail.data!.name,
              detail.data!.image,
              detail.data!.listType,
              color,
              detail.data!.url,
            ),
          ),
        );
      }
      return listData;
    } else {
      throw Exception(result.message);
    }
  }

  void openDetail(AllPokeEntity data) {
    Get.to(DetailPage(pageController: GetIt.I.get(), data: data,));
  }
}
