import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';

class BooksPageController extends GetxController {
  HomePageController homePageController = Get.find();
  AppController appController = Get.find();
  TextEditingController passwordController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  Future<void> deleteBook({required String id}) async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.darkGrey,
          ),
        ),
      );
      final response = await AuthRepository.deleteBook(
        requestData: {
          "password": passwordController.text,
        },
        bookID: id,
      );
      passwordController.clear();
      appController.listOfBooks.assignAll(response.data ?? []);
      Get.back(closeOverlays: true);
      homePageController.getBookList();
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back(closeOverlays: true);
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
