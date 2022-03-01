import 'dart:io';

import 'package:dio/dio.dart';

String getDioException(dynamic error) {
  String errorMessage = "";
  if (error is Exception) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            errorMessage = "Request cancelled";
            break;
          case DioErrorType.connectTimeout:
            errorMessage = "Connection timeout";
            break;
          case DioErrorType.other:
            errorMessage = "Connection error";
            break;
          case DioErrorType.receiveTimeout:
            errorMessage = "Receive timeout";
            break;
          case DioErrorType.response:
            switch (error.response!.statusCode) {
              case 400:
                errorMessage = error.response!.data;
                break;
              case 401:
                errorMessage = 'Unauthorized request';
                break;
              case 403:
                errorMessage = 'Unauthorized request';
                break;
              case 404:
                errorMessage = error.response!.data;
                break;
              case 409:
                errorMessage = "Conflict detected";
                break;
              case 408:
                errorMessage = "Request timeout";
                break;
              case 500:
                errorMessage = 'Internal server error';
                break;
              case 503:
                errorMessage = 'Service unavailable';
                break;
              default:
                errorMessage = "Something is wrong";
            }
            break;
          case DioErrorType.sendTimeout:
            errorMessage = "Send timeout";
            break;
        }
      } else if (error is SocketException) {
        errorMessage = "No internet connection";
      } else {
        errorMessage = "Unexpected error occured";
      }
      return errorMessage;
    } on FormatException {
      return errorMessage = "Unexpected error occured";
    } catch (_) {
      return errorMessage = "Unexpected error occured";
    }
  } else {
    if (error.toString().contains("is not a subtype of")) {
      return errorMessage = "Unexpected error occured";
    } else {
      return errorMessage = "Unexpected error occured";
    }
  }
}
