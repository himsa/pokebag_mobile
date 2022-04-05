import 'dart:convert';

import 'package:chance/chance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/detail_model.dart';
import 'package:pokebag_mobile/app/data/model/home_list_model.dart';
import 'package:pokebag_mobile/app/data/model/nav_args_model.dart';
import 'package:pokebag_mobile/app/data/model/pokebag_model.dart';
import 'package:pokebag_mobile/app/data/providers/detail_provider.dart';
import 'package:pokebag_mobile/app/routes/app_pages.dart';
import 'package:pokebag_mobile/core/cosmetics/typography.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';
import 'package:pokebag_mobile/core/widgets/spacer.dart';
import 'package:pokebag_mobile/core/widgets/widget_extensions.dart';

class DetailController extends GetxController {
  static DetailController find() => Get.find();
  final DetailProvider provider;
  DetailController({
    required this.provider,
  });

  Rxn<DetailModel> detailModel = Rxn<DetailModel>();
  RxBool isDetailLoading = RxBool(false);

  NavArgsModel? navArgsModel;
  Results? data;

  @override
  void onInit() {
    fetchDetail();
    super.onInit();
  }

  @override
  void onClose() {}

  /// detail data from api
  void fetchDetail() async {
    navArgsModel = Get.arguments as NavArgsModel;
    data = navArgsModel?.data as Results;
    isDetailLoading(true);
    try {
      final response = await provider.detail(data?.name);
      detailModel.value = response;
    } catch (err) {
      debugPrint("Detail err $err");
    }
    isDetailLoading(false);
  }

  saveList(List<PokeBagModel> listNeedToSave) {
    String? oldSavedData =
        GetStorageManager().readList(GetStorageManager.pokebagKey);

    if (oldSavedData != null) {
      List<PokeBagModel> oldSavedList = RxList<PokeBagModel>();
      jsonDecode(oldSavedData).forEach((v) {
        oldSavedList.add(PokeBagModel.fromJson(v));
      });
      oldSavedList.addAll(listNeedToSave);
      return GetStorageManager()
          .saveList(GetStorageManager.pokebagKey, oldSavedList);
    } else {
      return GetStorageManager()
          .saveList(GetStorageManager.pokebagKey, listNeedToSave);
    }
  }

  void capture() {
    bool isSuccess = Chance.boolean(likelihood: 60);
    if (isSuccess) {
      String userName = '';
      Get.bottomSheet(
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Gotcha!', style: AppRegularText.header4),
              AppSizedBox.height(),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0),
                  ),
                  label: Text('Now enter your ${data?.name} nickname'),
                ),
                onChanged: (v) {
                  userName = v;
                },
              ),
              AppSizedBox.height(),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Tapped!!');
                  var data = PokeBagModel(
                    name: this.data?.name ?? '',
                    url: this.data?.url ?? '',
                    username: userName,
                  );
                  saveList([data]);
                  Get.back();
                  Get.bottomSheet(
                    Container(
                      child: Column(
                        children: [
                          Text('Your Pokemon is safe and sound in your pokebag',
                              style: AppRegularText.header4),
                          AppSizedBox.height(),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: Get.back,
                                  child: Text('close'),
                                ),
                              ),
                              AppSizedBox.widthSmall(),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Get.offNamed(Routes.HOME);
                                    // await 0.3.delay();
                                    Get.toNamed(Routes.POKEBAG);
                                  },
                                  child: Text('See Pokebag'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).bottomSheetWrapper(),
                  );
                },
                child: Text('submit'),
              ),
            ],
          ),
        ).bottomSheetWrapper(),
      );
    } else {
      Get.bottomSheet(
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Sorry, lady luck not in your side !',
                  style: AppRegularText.header4),
              AppSizedBox.height(),
              ElevatedButton(
                onPressed: Get.back,
                child: Text('close'),
              ),
            ],
          ),
        ).bottomSheetWrapper(),
      );
    }
  }
}
