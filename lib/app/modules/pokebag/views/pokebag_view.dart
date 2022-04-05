import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';
import 'package:pokebag_mobile/core/widgets/list_loading.dart';
import 'package:pokebag_mobile/core/widgets/pokebag_tem_list.dart';

import '../controllers/pokebag_controller.dart';

class PokebagView extends GetView<PokebagController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokebagView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isPokeBagListLoading.value
            ? ShimmerListLoadingWidget()
            : SingleChildScrollView(
                child: Obx(() => controller.list.isNotEmpty
                    ? Wrap(
                        spacing: AppSpacing.small,
                        children: controller.list.map((item) {
                          // get index
                          var index = controller.list.indexOf(item);
                          return PokeBagItemList(item, index);
                        }).toList(),
                      )
                    : SizedBox()),
              ),
      ),
    );
  }
}
