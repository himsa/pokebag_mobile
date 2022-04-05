import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/detail_model.dart';
import 'package:pokebag_mobile/app/data/model/home_list_model.dart';
import 'package:pokebag_mobile/app/data/model/nav_args_model.dart';
import 'package:pokebag_mobile/app/data/model/pokebag_model.dart';
import 'package:pokebag_mobile/app/data/providers/detail_provider.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

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
}
