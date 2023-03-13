import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:akarosmi/app/data/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/service/storage_service.dart';
import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/model/request_model/edit_profile_request_model.dart';
import '../../../routes/app_pages.dart';
import '../../home_page/controllers/home_page_controller.dart';

class ProfilePageController extends GetxController {
  TextEditingController dobController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  HomePageController homePageController = Get.find();
  AppController appController = Get.find();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void onInit() {
    firstNameController.text = "${appController.userData?.firstName}";
    lastNameController.text = "${appController.userData?.lastName}";
    dobController.text = "${appController.userData?.date}";
    selectedGender.value =
        "${appController.userData?.gender?.toUpperCase().capitalizeFirst}";
    phoneNumberController.text = "${appController.userData?.phoneNumber}";
    emailController.text = "${appController.userData?.email}";

    super.onInit();
  }

  var selectedGender = "Male".obs;

  final List genderItem = [
    'Male',
    'Female',
    'Other',
  ];

  Future<void> editProfile() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.editUser(
          requestData: EditProfileRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        date: dobController.text,
        gender: selectedGender.value.toLowerCase(),
        phoneCode: "+91",
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
      ));
      ToastUtils.showBottomSnackbar("${response.message}");
      appController.userData = response.data;
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> deleteUser() async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      final response = await AuthRepository.deleteUser(
        requestData: {
          "password": passwordController.text,
        },
      );
      passwordController.clear();
      Get.back(closeOverlays: true);
      StorageService.clearUserData();
      StorageService.clearToken();
      Get.offAllNamed(Routes.LOGIN_PAGE);
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back();
      Get.back();
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back(closeOverlays: true);
    }
  }
}
