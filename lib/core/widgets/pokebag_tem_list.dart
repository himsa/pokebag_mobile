import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/nav_args_model.dart';
import 'package:pokebag_mobile/app/data/model/pokebag_model.dart';
import 'package:pokebag_mobile/app/modules/pokebag/controllers/pokebag_controller.dart';
import 'package:pokebag_mobile/app/routes/app_pages.dart';
import 'package:pokebag_mobile/core/constant/const.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/cosmetics/typography.dart';
import 'package:pokebag_mobile/core/widgets/spacer.dart';

class PokeBagItemList extends GetView<PokebagController> {
  final PokeBagModel? item;
  final int? index;
  PokeBagItemList(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: AppSpacing.allRadius),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text((item?.username?.capitalizeFirst ?? ''),
                      style: AppRegularText.header3),
                  Text((item?.name?.capitalizeFirst ?? ''),
                      style: AppRegularText.header5),
                  AppSizedBox.height(),
                  IconButton(
                    icon: Card(
                      child: Icon(Icons.delete),
                    ),
                    onPressed: () {
                      controller.removeItem(item!);
                    },
                  ),
                ],
              ),
              Image.network(
                '${Const.imageURL}${(index ?? 0) + 1}.png',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
