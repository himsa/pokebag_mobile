import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

class HomeController extends GetxController {
  final isDark = Get.isPlatformDarkMode.obs;
  final initialIcon = 0.obs;

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

    super.onInit();
  }

  @override
  void onClose() {}

  void changeTheme(bool val) {
    Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
    GetStorageManager.getStorage.write(GetStorageManager.darkmode, val);
    isDark.value = val;
  }
}
