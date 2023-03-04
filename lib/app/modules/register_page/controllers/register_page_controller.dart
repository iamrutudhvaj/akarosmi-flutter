import 'package:akarosmi/app/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/utils/toast.dart';
import '../../../routes/app_pages.dart';

class RegisterPageController extends GetxController {
  TextEditingController dobController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var selectedGender = "".obs;

  final List genderItem = [
    'Male',
    'Female',
    'Other',
  ];

  final _genderValueCheck = false.obs;
  bool get genderValueCheck => _genderValueCheck.value;
  set genderValueCheck(bool value) => _genderValueCheck.value = value;

  final formGlobalKey = GlobalKey<FormState>();

  Future<void> userRegistration() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.registration(
        requestData: {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "date": dobController.text,
          "gender": selectedGender.value.toLowerCase(),
          "phone_code": "+91",
          "phone_number": phoneNumberController.text,
          "email": emailController.text,
        },
      );
      Get.offAllNamed(Routes.LOGIN_PAGE, arguments: emailController.text);
      ToastUtils.showBottomSnackbar("${response.message}");
      Get.back();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
