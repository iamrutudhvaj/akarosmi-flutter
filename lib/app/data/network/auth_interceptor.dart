import 'dart:io';
import 'package:dio/dio.dart';

import '../../core/service/storage_service.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = StorageService.getToken();
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = token;
    }
    handler.next(options);
  }
}
