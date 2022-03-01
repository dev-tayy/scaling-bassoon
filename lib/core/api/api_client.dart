import 'package:defi/core/api/endpoints.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<List> get({Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(Endpoints.baseUrl);
      return response.data as List;
    } on FormatException {
      throw const FormatException("Bad response format 👎");
    } catch (e) {
      rethrow;
    }
  }
}
