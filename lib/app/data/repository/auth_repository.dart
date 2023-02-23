import 'package:akarosmi/app/core/constant/uri.dart';
import 'package:akarosmi/app/data/model/response_model/registration_response.dart';
import 'package:akarosmi/app/data/network/api_controller.dart';

class AuthRepository {
  static Future<RegistrationResponse> registration(
      {required Map<String, dynamic> requestData}) async {
    final response =
        await ApiController.post(path: UriPath.registration, data: requestData);
    return RegistrationResponse.fromJson(response);
  }
}
