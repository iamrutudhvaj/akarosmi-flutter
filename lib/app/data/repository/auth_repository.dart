import 'package:akarosmi/app/data/model/response_model/login_response.dart';

import '../../core/constant/uri.dart';
import '../network/api_controller.dart';

class AuthRepository {
  static Future<LoginResponse> login(
      {required Map<String, dynamic> reqestData}) async {
    final response = await ApiController.post(
      path: UriPath.login,
      data: reqestData,
    );
    return LoginResponse.fromJson(response);
  }
}
