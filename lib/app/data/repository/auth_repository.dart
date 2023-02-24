import 'package:akarosmi/app/core/constant/uri.dart';
import 'package:akarosmi/app/data/model/response_model/registration_response.dart';
import 'package:akarosmi/app/data/network/api_controller.dart';
import 'package:akarosmi/app/data/model/response_model/login_response.dart';

import '../model/response_model/forget_password_response.dart';

class AuthRepository {
  static Future<RegistrationResponse> registration(
      {required Map<String, dynamic> requestData}) async {
    final response =
        await ApiController.post(path: UriPath.registration, data: requestData);
    return RegistrationResponse.fromJson(response);
  }

  // Here we are using Login data response for returning data at the place of change password data because both model are same.
  static Future<LoginResponse> changePassword({
    required Map<String, dynamic> requestData,
  }) async {
    final response = await ApiController.post(
      path: UriPath.changePassword,
      data: requestData,
    );
    return LoginResponse.fromJson(response);
  }

  static Future<LoginResponse> login(
      {required Map<String, dynamic> requestData}) async {
    final response = await ApiController.post(
      path: UriPath.login,
      data: requestData,
    );
    return LoginResponse.fromJson(response);
  }

  static Future<ForgetPasswordResponse> forgetPassword(
      {required Map<String, dynamic> requestData}) async {
    final response = await ApiController.post(
      path: UriPath.forgetPassword,
      data: requestData,
    );
    return ForgetPasswordResponse.fromJson(response);
  }
}
