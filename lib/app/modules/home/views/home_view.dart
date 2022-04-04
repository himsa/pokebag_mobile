import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebag_mobile/core/widgets/home_app_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Obx(
            () => HomeAppBar(
              onPressedDarkMode: () =>
                  controller.changeTheme(!controller.isDark.value),
              initialIConIndex: controller.initialIcon.value,
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
