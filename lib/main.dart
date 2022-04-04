import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebag_mobile/main_binding.dart';

import 'app/routes/app_pages.dart';
import 'core/cosmetics/app_theme.dart';
import 'core/lang/lang_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainBinding().dependencies();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: AppTheme().config(),
      darkTheme: AppTheme().dark(),
      navigatorObservers: [],
      translations: LangConfig(),
      locale: Get.deviceLocale,
      fallbackLocale: LangConfig.fallbackLocale,
      debugShowCheckedModeBanner: kDebugMode,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
