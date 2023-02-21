import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController emailCotroller = TextEditingController();

  final _obsecureText = true.obs;
  bool get obsecureText => _obsecureText.value;
  set obsecureText(bool value) => _obsecureText.value = value;
}
