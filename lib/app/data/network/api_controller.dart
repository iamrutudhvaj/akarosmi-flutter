import 'dart:io';

import 'package:akarosmi/app/data/model/response_model/upload_asset_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constant/uri.dart';
import 'auth_interceptor.dart';

class ApiController {
  static late Dio _dio;
  static void init() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      baseUrl: dotenv.env['BASE_URL']!,
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
    _dio.interceptors.add(AuthInterceptor());
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

  //UPLOAD IMAGE
  static Future<List<String>?> uploadFile(List<XFile?> files) async {
    try {
      var imgList = [];

      for (var element in files) {
        imgList.add(await MultipartFile.fromFile(element!.path));
      }

      FormData formData = FormData.fromMap({"images": imgList});
      final response = await _dio.post(
        "${UriPath.uploadAsset}${dotenv.env['UPLOAD_ASSET']}",
        data: formData,
      );
      return UploadAssetResponse.fromJson(response.data).data?.values.toList();
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
