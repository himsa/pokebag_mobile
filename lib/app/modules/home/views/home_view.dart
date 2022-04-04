import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/nav_args_model.dart';
import 'package:pokebag_mobile/app/routes/app_pages.dart';
import 'package:pokebag_mobile/core/constant/const.dart';
import 'package:pokebag_mobile/core/cosmetics/colors.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/cosmetics/typography.dart';
import 'package:pokebag_mobile/core/widgets/home_app_bar.dart';
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
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: AppSpacing.allRadius),
                      child: InkWell(
                        onTap: () => Get.toNamed(
                          Routes.DETAIL,
                          arguments: NavArgsModel(
                            from: Routes.HOME,
                            to: Routes.DETAIL,
                            data: item,
                          ),
                        ),
                        child: Container(
                          padding: AppSpacing.paddingAllMain,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text((item.name?.capitalizeFirst ?? ''),
                                      style: AppRegularText.header3)
                                ],
                              ),
                              Image.network(
                                '${Const.imageURL}${index + 1}.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
