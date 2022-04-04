import 'package:chance/chance.dart';
import 'package:get/get.dart';

class PokebagController extends GetxController {
  int randomInteger = Chance.integer(min: 3, max: 12); // 5

  double randomDouble = Chance.floating(min: 3, max: 12); // 10.9634128828224

  bool randomBool = Chance.boolean(likelihood: 30); // false

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
