import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

class AppTheme {
  ThemeMode config() {
    bool isDark = GetStorageManager().getValue(GetStorageManager.darkmode) ??
        Get.isPlatformDarkMode;
    if (isDark) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  ThemeData dark() {
    return ThemeData.from(
      colorScheme: ColorScheme.dark(
        secondary: Colors.green,
        secondaryContainer: Color(
          0xff388e3c,
        ),
      ),
    );
  }
}
