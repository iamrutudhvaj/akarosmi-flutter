import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _pre = GetStorage();
  
  static Future<void> setToken(String token) async {
    await _pre.write(StorageKeys.token, token);
  }

  static String? getToken() {
    return _pre.read(StorageKeys.token);
  }

  static Future<void> clearToken() async {
    await _pre.remove(StorageKeys.token);
  }
}

abstract class StorageKeys {
  static String token = "TOKEN";
}
