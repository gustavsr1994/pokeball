import 'package:pokeball/app/domain/usecases/get_poke_usecase.dart';
import 'package:pokeball/core/config/base/base_controller.dart';

class PokeAllController extends BaseController {
  GetPokeUsecase getPokeUsecase;
  PokeAllController(this.getPokeUsecase);

  void loadAllPoke(){
    getPokeUsecase.call(1);

  }
}