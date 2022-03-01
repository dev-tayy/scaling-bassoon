import 'package:defi/core/api/api_client.dart';
import 'package:defi/core/api/api_result.dart';
import 'package:defi/core/exceptions/ex.dart';
import 'package:defi/core/models/crypto.dart';

class CoinRepository {
  final ApiClient _apiClient;

  CoinRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  Future<ApiResult> getCoindata() async {
    try {
      final response = await _apiClient.get();
      final data = response.map((e) => CoinData.fromJson(e)).toList();
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: getDioException(e));
    }
  }
}
