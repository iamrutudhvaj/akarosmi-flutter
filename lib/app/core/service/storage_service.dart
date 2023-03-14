import 'package:akarosmi/app/data/model/response_model/login_response.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _pre = GetStorage();

  static Future<void> setToken(String token) async {
    await _pre.write(StorageKeys.token, token);
  }

  static String? getToken() {
    return _pre.read(StorageKeys.token);
  }

  static Future<void> setUserData(UserData userData) async {
    await _pre.write(StorageKeys.userData, userData);
  }

  static UserData? getUserData() {
    return UserData.fromJson(_pre.read(StorageKeys.userData));
  }

  static Future<void> clearUserData() async {
    await _pre.remove(StorageKeys.userData);
  }

  static Future<void> clearToken() async {
    await _pre.remove(StorageKeys.token);
  }
}

abstract class StorageKeys {
  static String token = "TOKEN";
  static String userData = "USER_DATA";
}
