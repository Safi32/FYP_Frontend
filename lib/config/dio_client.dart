import 'package:dine_deal/config/app_config.dart';
import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseURL,
        connectTimeout: const Duration(microseconds: AppConfig.connectTimeout),
        receiveTimeout: const Duration(microseconds: AppConfig.receiveTimeout),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }
}
