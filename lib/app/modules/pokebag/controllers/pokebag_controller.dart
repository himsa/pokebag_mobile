import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/pokebag_model.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

class PokebagController extends GetxController {
  static PokebagController find() => Get.find();

  RxList<PokeBagModel> list = RxList();

  RxBool isPokeBagListLoading = RxBool(false);

  @override
  void onInit() {
    initLocalData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  removeItem(PokeBagModel itemToDelete) {
    if (list.isNotEmpty) {
      list.removeWhere((element) => element == itemToDelete);
      return GetStorageManager().saveList(GetStorageManager.pokebagKey, list);
    }
  }

  readList() => GetStorageManager().readList(GetStorageManager.pokebagKey);

  void initLocalData() {
    list.clear();
    isPokeBagListLoading(true);
    if (readList() != null) {
      debugPrint(readList());
      list = RxList<PokeBagModel>();
      jsonDecode(readList()).forEach((v) {
        list.add(PokeBagModel.fromJson(v));
      });
    }
    isPokeBagListLoading(false);
  }
}
