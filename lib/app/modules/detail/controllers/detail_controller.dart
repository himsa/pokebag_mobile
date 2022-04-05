import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/app/data/model/detail_model.dart';
import 'package:pokebag_mobile/app/data/model/home_list_model.dart';
import 'package:pokebag_mobile/app/data/model/nav_args_model.dart';
import 'package:pokebag_mobile/app/data/providers/detail_provider.dart';

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
}
