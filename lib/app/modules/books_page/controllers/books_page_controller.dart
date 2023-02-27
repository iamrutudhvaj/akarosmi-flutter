import 'package:akarosmi/app/data/model/response_model/list_of_book_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';

class BooksPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  RxList<String> bookList = RxList<String>.empty(growable: true);

  final _listOfUserBookData = ListOfBookUserResponseModel().obs;
  ListOfBookUserResponseModel get listOfUserBookData =>
      _listOfUserBookData.value;
  set listOfUserBookData(ListOfBookUserResponseModel value) =>
      _listOfUserBookData.value = value;

  @override
  void onInit() {
    userListOfBookData();
    super.onInit();
  }

  final formGlobalKey = GlobalKey<FormState>();

  Future<void> userListOfBookData() async {
    try {
      final response = await AuthRepository.userListOfBook();
      listOfUserBookData = response;
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<void> deleteBookData({required String id}) async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      final response = await AuthRepository.deleteBookData(
        requestData: {
          "password": passwordController.text,
        },
        bookID: id,
      );
      passwordController.clear();
      Get.back();
      listOfUserBookData = response;
      userListOfBookData();
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
