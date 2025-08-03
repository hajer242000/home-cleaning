import 'package:dio/dio.dart';
import 'package:homecleaning/core/errors/error_register/error_sign_up.dart';


class ServerExceptionRegister implements Exception {
  final ErrorModelRegister errModel;

  ServerExceptionRegister({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerExceptionRegister(errModel: ErrorModelRegister.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
        case 401: //unauthorized
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
        case 403: //forbidden
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
        case 404: //not found
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
        case 409: //cofficient
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
        case 422: //  Unprocessable Entity
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
        case 504: // Server exception
          throw ServerExceptionRegister(
            errModel: ErrorModelRegister.fromJson(e.response!.data),
          );
      }
  }
}

void handleRegisterDioExceptions(DioException e) {
  final data = e.response?.data;
  if (data != null && data is Map<String, dynamic>) {
    throw ServerExceptionRegister(
      errModel: ErrorModelRegister.fromJson(data),
    );
  }
  throw Exception("Unhandled register error");
}
