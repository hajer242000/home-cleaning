import 'package:dio/dio.dart';
import 'package:homecleaning/core/api/api_consumer.dart';
import 'package:homecleaning/core/api/api_interceptors.dart';
import 'package:homecleaning/core/constant/base_url.dart';
import 'package:homecleaning/core/errors/error_sign_in/server_exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = BaseUrl.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data!,
        queryParameters: queryParameter!,
      );
      return response.data;
    } on DioException catch (e) {
        handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
        handleDioExceptions(e);
    }
  }

   @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: data!,
        queryParameters: queryParameter!,
      );
      return response.data;
    } on DioException catch (e) {
        handleDioExceptions(e);
    }
  }

   @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
        handleDioExceptions(e);
    }
  }
}
