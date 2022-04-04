import 'package:dio/dio.dart';
import 'package:pokebag_mobile/app/data/model/home_list_model.dart';
import 'package:pokebag_mobile/core/network/api_methods.dart';

class HomeProvider {
  final ApiClient apiClient;
  HomeProvider({required this.apiClient});

  Future<HomeListModel> homePageList() async {
    // final formData = {}.toFormData();
    final url = '/v2/pokemon/?limit=20&offset=0';
    Map<String, dynamic> response = await apiClient.generatePostRequest(
      url,
      body: FormData(),
      isGet: true,
    );
    return HomeListModel.fromJson(response);
  }
}
