import 'package:dio/dio.dart';

extension Forms on Map {
  FormData toFormData() => FormData.fromMap(this as Map<String, dynamic>);
}
