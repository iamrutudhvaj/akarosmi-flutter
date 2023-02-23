import 'dart:io';

import 'package:dio/dio.dart';

class ApiController {
  static late Dio _dio;
  static void init() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      baseUrl: 'http://192.168.29.184:5000',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
      },
    );
    _dio = Dio(dioOptions);
    _setupInterceptors();
  }

  static void _setupInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  // GET
  static Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // POST
  static Future<Map<String, dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // POST with File
  static Future<Map<String, dynamic>> postWithFile({
    required String path,
    required FormData data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // PUT
  static Future<Map<String, dynamic>> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // PATCH
  static Future<Map<String, dynamic>> patch({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // PATCH
  static Future<Map<String, dynamic>?> delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // Upload File
  static Future<void> uploadFile(String path, File file) async {
    try {
      var len = await file.length();
      await Dio().put(
        path,
        data: file.openRead(),
        options: Options(
          headers: {
            Headers.contentLengthHeader: len, // set content-length
          },
        ),
      );
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
