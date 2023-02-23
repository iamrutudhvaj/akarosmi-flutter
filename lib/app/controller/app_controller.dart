import 'package:get/get.dart';

import '../data/model/response_model/login_response.dart';

class AppController extends GetxController {
  final _userData = Rx<UserData?>(null);
  UserData? get userData => _userData.value;
  set userData(UserData? value) => _userData.value = value;
}
