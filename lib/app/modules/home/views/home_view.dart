import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/widgets/home_app_bar.dart';
import 'package:pokebag_mobile/core/widgets/home_tem_list.dart';
import 'package:pokebag_mobile/core/widgets/list_loading.dart';
import 'package:pokebag_mobile/core/widgets/spacer.dart';

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
        body: Obx(
          () => controller.isHomeListLoading.value
              ? ShimmerListLoadingWidget()
              : ListView.separated(
                  padding: AppSpacing.paddingAllMain,
                  itemBuilder: (context, index) {
                    var item = controller.homeListModel.value!.results![index];
                    return HomeItemList(item, index);
                  },
                  separatorBuilder: (context, index) {
                    return AppSizedBox.heightSmall();
                  },
                  itemCount:
                      controller.homeListModel.value?.results?.length ?? 0),
        ),
      ),
    );
  }
}
