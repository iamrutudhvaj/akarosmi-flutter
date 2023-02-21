import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final _obsecureText = true.obs;
  bool get obsecureText => _obsecureText.value;
  set obsecureText(bool value) => _obsecureText.value = value;
}
