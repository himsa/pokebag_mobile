import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/home_list_model.dart';
import 'package:pokebag_mobile/app/data/providers/home_provider.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

class HomeController extends GetxController {
  static HomeController find() => Get.find();
  final HomeProvider provider;
  HomeController({
    required this.provider,
  });

  final isDark = Get.isPlatformDarkMode.obs;
  final initialIcon = 0.obs;

  Rxn<HomeListModel> homeListModel = Rxn<HomeListModel>();
  RxBool isHomeListLoading = RxBool(false);

  @override
  void onInit() {
    isDark.value =
        GetStorageManager.getStorage.read(GetStorageManager.darkmode) ??
            Get.isPlatformDarkMode;
    if (isDark.value) {
      initialIcon.value = 0;
    } else {
      initialIcon.value = 1;
    }
    fetchList();
    super.onInit();
  }

  @override
  void onClose() {}

  void changeTheme(bool val) {
    Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
    GetStorageManager.getStorage.write(GetStorageManager.darkmode, val);
    isDark.value = val;
  }

  /// list data from api
  void fetchList() async {
    isHomeListLoading(true);
    try {
      final response = await provider.homePageList();
      homeListModel.value = response;
    } catch (err) {
      print("Home err $err");
    }
    isHomeListLoading(false);
  }
}
