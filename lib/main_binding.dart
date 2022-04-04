import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Register all neccesary reuse class here
    // Its like injection container

    await GetStorage.init();
    Get.put(
      GetStorageManager(),
      permanent: true,
    );
  }
}
