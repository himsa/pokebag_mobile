import 'dart:convert';

import 'package:chance/chance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/pokebag_model.dart';
import 'package:pokebag_mobile/core/local/get_storage.dart';

class PokebagController extends GetxController {
  static PokebagController find() => Get.find();

  int randomInteger = Chance.integer(min: 3, max: 12); // 5

  double randomDouble = Chance.floating(min: 3, max: 12); // 10.9634128828224

  bool randomBool = Chance.boolean(likelihood: 30); // false

  RxList<PokeBagModel> list = RxList();

  RxBool isPokeBagListLoading = RxBool(false);

  @override
  void onInit() {
    _initLocalData();

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

  void _initLocalData() {
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
