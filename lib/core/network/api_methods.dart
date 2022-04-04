import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as form;
import 'package:dio/dio.dart' as res;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pokebag_mobile/core/constant/const.dart';
import 'package:pokebag_mobile/core/utils/methods.dart';

class ApiException implements Exception {
  String message;
  // ignore: prefer_typing_uninitialized_variables
  var response;
  ApiException(this.response)
      : message = response["message"] ?? "Something Went Wrong";

  @override
  String toString() => message;
}

class NetWorkException implements Exception {
  String message;
  NetWorkException(this.message);
  @override
  String toString() => message;
}

class ApiClient {
  final Dio dioClient;
  String? device;
  String? ipAddressGlobal = '';

  ApiClient({required this.dioClient}) {
    device = "Android";
    if (GetPlatform.isIOS) device = "IOS";
  }

  /// Generate HTTP Request using DIO.
  ///
  /// Auto Generate Signature.
  ///
  /// Auto Add ActionBy and UserUID if user logged in.
  ///
  /// Checks for API Status and throws [APIException].
  Future generatePostRequest(
    String url, {
    form.FormData? body,
    bool toastOnError = true,
    bool isGet = false,
  }) async {
    body ??= form.FormData();

    logAPIRequestData(url, body);

    res.Response? response;
    try {
      if (isGet) {
        response = await dioClient.get(url);
      } else {
        response = await dioClient.post(url, data: body);
      }
    } catch (e) {
      String? statusMessage;
      int? statusCode;
      if (e is DioError) {
        if (e.type == DioErrorType.connectTimeout) {
          statusMessage = "Request Timeout";
          statusCode = 408;
        } else if (e.error == DioErrorType.receiveTimeout) {
          statusMessage = "No data received";
          statusCode = 408;
        } else {
          print(e.toString());
          statusMessage = "Slow internet connection";
          ipAddressGlobal = '';
        }
        response = res.Response(
          statusMessage: statusMessage,
          statusCode: statusCode,
          requestOptions: RequestOptions(path: ''),
        );
      } else {
        response = res.Response(
          statusMessage: e.toString(),
          requestOptions: RequestOptions(path: ''),
        );
      }
    }
    var responseJSON = _checkAPIErrors(response, url, toastOnError);
    return responseJSON;
  }

  /// checks for network error and api error,
  /// returns null if something goes wrong,
  /// show toast message on any error
  _checkAPIErrors(res.Response response, String url, bool toastOnError) {
    final int statusCode = response.statusCode ?? 0;
    final String statusMessage = response.statusMessage!;

    if (statusCode != 200) {
      debugPrint("---- Error $url");
      debugPrint("Status Code $statusCode");
      debugPrint("Status Message $statusMessage");
      debugPrint("---- End Error");
      SnackBarMethods.error(statusMessage);
      throw NetWorkException(statusMessage);
    } else {
      final responseJson = response.data;

      debugPrint("---- Response $url");
      debugPrint(responseJson.toString());
      debugPrint("---- End Response");

      return responseJson;
    }
  }

  /// logs the request data to console
  void logAPIRequestData(
    String url,
    form.FormData body,
  ) {
    String bodyMerged = '';
    debugPrint("---- Request $url");

    for (var map in body.fields) {
      debugPrint('${map.key} : ${map.value}');
      var index = body.fields.indexOf(map);
      if (index == 0) {
        bodyMerged = bodyMerged + '${map.key}=${map.value}';
      } else {
        bodyMerged = bodyMerged + '&${map.key}=${map.value}';
      }
    }

    debugPrint("---- End Request");
    debugPrint("${Const.apiURL}$url?$bodyMerged");
  }
}
