import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/pokebag_model.dart';
import 'package:pokebag_mobile/app/routes/app_pages.dart';
import 'package:pokebag_mobile/core/constant/const.dart';
import 'package:pokebag_mobile/core/cosmetics/colors.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/cosmetics/typography.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';
import 'package:pokebag_mobile/core/widgets/chip.dart';
import 'package:pokebag_mobile/core/widgets/list_loading.dart';
import 'package:pokebag_mobile/core/widgets/spacer.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.data?.name?.capitalizeFirst ?? '',
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Card(
              child: Icon(Icons.abc),
            ),
            onPressed: () {
              Get.toNamed(Routes.POKEBAG);
            },
          ),
        ],
      ),
      floatingActionButton: IconButton(
        icon: Card(
          child: Icon(Icons.abc),
        ),
        onPressed: () {
          debugPrint('Tapped!!');
          var data = PokeBagModel(
            name: controller.data?.name ?? '',
            url: controller.data?.url ?? '',
            username: 'test',
          );
          GetStorageManager().saveList(GetStorageManager.pokebagKey, [data]);
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Obx(
        () => controller.isDetailLoading.value
            ? ShimmerListLoadingWidget()
            : SingleChildScrollView(
                padding: AppSpacing.paddingAllMain,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Wrap(
                        spacing: AppSpacing.small,
                        children: controller.detailModel.value?.types
                                ?.map(
                                  (type) => AppFilterChip(
                                    backgroundColor: AppColors.dark,
                                    outline: true,
                                    label: type.type?.name ?? '',
                                    isSelected: true,
                                    borderRadius: AppSpacing.small,
                                    textStyle: AppRegularText.body1,
                                    onTap: () {},
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    ),
                    Center(
                      child: Image.network(
                        '${controller.detailModel.value?.sprites?.frontDefault}',
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Moves',
                      style: AppMediumText.header4,
                    ),
                    AppSizedBox.height(),
                    Obx(
                      () => Wrap(
                        spacing: AppSpacing.small,
                        runSpacing: AppSpacing.small,
                        children: controller.detailModel.value?.moves
                                ?.map(
                                  (move) => AppFilterChip(
                                    backgroundColor:
                                        Color.fromRGBO(15, 98, 254, 1.0),
                                    outline: true,
                                    label: move.move?.name ?? '',
                                    isSelected: true,
                                    borderRadius: AppSpacing.small,
                                    textStyle: AppRegularText.body1,
                                    onTap: () {},
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
