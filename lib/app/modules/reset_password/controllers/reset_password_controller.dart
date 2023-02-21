import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final _obsecureText = true.obs;
  bool get obsecureText => _obsecureText.value;
  set obsecureText(bool value) => _obsecureText.value = value;

  final _obsecureTextNewPass = true.obs;
  bool get obsecureTextNewPass => _obsecureTextNewPass.value;
  set obsecureTextNewPass(bool value) => _obsecureTextNewPass.value = value;

  final _obsecureTextConfirmPass = true.obs;
  bool get obsecureTextConfirmPass => _obsecureTextConfirmPass.value;
  set obsecureTextConfirmPass(bool value) =>
      _obsecureTextConfirmPass.value = value;
}
