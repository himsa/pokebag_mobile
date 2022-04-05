import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/home_list_model.dart';
import 'package:pokebag_mobile/app/data/model/nav_args_model.dart';
import 'package:pokebag_mobile/app/routes/app_pages.dart';
import 'package:pokebag_mobile/core/constant/const.dart';
import 'package:pokebag_mobile/core/cosmetics/spacing.dart';
import 'package:pokebag_mobile/core/cosmetics/typography.dart';

class HomeItemList extends StatelessWidget {
  final Results? item;
  HomeItemList(this.item);

  @override
  Widget build(BuildContext context) {
    var uri = Uri.dataFromString(item?.url ?? '');
    var id = uri.pathSegments[6];
    return Card(
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
                  Text((item?.name?.capitalizeFirst ?? ''),
                      style: AppRegularText.header3)
                ],
              ),
              Image.network(
                '${Const.imageURL}$id.png',
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
