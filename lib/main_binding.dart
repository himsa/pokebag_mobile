import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokebag_mobile/core/constant/const.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';
import 'package:pokebag_mobile/core/network/api_methods.dart';
import 'package:pokebag_mobile/core/network/api_provider.dart';

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
    Get.put(
      Dio(
        BaseOptions(
          baseUrl: Const.apiURL,
          connectTimeout: Const.connectionTimeout,
          receiveTimeout: Const.connectionTimeout,
        ),
      ),
      permanent: true,
    );
    Get.put(
      ApiClient(
        dioClient: Get.find(),
      ),
      permanent: true,
    );
    APIProvider().initilizeProviders();
  }
}
