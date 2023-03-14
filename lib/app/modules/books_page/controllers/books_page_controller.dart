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

  String getStatus(index) {
    if (appController.listOfBooks[index].status == "1") {
      return 'Available';
    } else if (appController.listOfBooks[index].status == "2") {
      return 'Allocated';
    } else {
      return 'Away';
    }
  }

  Color getStatusColor(index) {
    if (appController.listOfBooks[index].status == "1") {
      return const Color(0xff147F7F);
    } else if (appController.listOfBooks[index].status == "2") {
      return const Color(0xffED9D2F);
    } else {
      return const Color(0xffEA5958);
    }
  }

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
