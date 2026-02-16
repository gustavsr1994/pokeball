import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeball/app/domain/entities/species_entity.dart';
import 'package:pokeball/app/domain/usecases/get_evolution_usecase.dart';
import 'package:pokeball/core/config/base/base_controller.dart';
import 'package:pokeball/core/utils/misc/constant.dart';

import '../../domain/entities/all_poke_entity.dart';
import '../../domain/usecases/get_species_usecase.dart';

class DetailController extends BaseController {
  GetSpecialUsecase getSpecialUsecase;
  GetEvolutionUsecase getEvolutionUsecase;
  DetailController(this.getSpecialUsecase, this.getEvolutionUsecase);

  AllPokeEntity? detailEntity;
  SpeciesEntity? speciesEntity;
  String label = nameTab.first;

  void initialPage(AllPokeEntity data) async {
    showLoading();
    detailEntity = data;
    var dataSpecial = await getSpecialUsecase.call(detailEntity!.url);
    speciesEntity = dataSpecial.data;
    dismissLoading();
  }

  void actionTap(int index) {
    label = nameTab[index];
    refreshUI();
  }
}
