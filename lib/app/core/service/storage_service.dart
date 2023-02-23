import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _pre = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static Future<void> setToken(String token) async {
    await _pre.write(StorageKeys.token, token);
  }

  static Future<String?> getToken() async {
    return _pre.read(StorageKeys.token);
  }

  static Future<void> clearToken() async {
    return _pre.erase();
  }
}

abstract class StorageKeys {
  static String token = "TOKEN";
}