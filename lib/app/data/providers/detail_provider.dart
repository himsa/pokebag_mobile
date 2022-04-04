import 'package:dio/dio.dart';
import 'package:pokebag_mobile/app/data/model/detail_model.dart';
import 'package:pokebag_mobile/core/network/api_methods.dart';

class DetailProvider {
  final ApiClient apiClient;
  DetailProvider({required this.apiClient});

  Future<DetailModel> detail(String? name) async {
    final url = '/v2/pokemon/$name';
    Map<String, dynamic> response = await apiClient.generatePostRequest(
      url,
      body: FormData(),
      isGet: true,
    );
    return DetailModel.fromJson(response);
  }
}
