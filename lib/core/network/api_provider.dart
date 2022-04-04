import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/providers/home_provider.dart';

class APIProvider {
  void initilizeProviders() {
    Get.lazyPut(() => HomeProvider(apiClient: Get.find()), fenix: true);
  }
}
