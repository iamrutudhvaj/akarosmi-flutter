import 'package:akarosmi/app/data/model/response_model/list_of_book_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';

class BooksPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  final _listOfBooks = BookListResponse().obs;
  BookListResponse get listOfBooks => _listOfBooks.value;
  set listOfBooks(BookListResponse value) => _listOfBooks.value = value;

  @override
  void onInit() {
    getBookList();
    super.onInit();
  }

  final formGlobalKey = GlobalKey<FormState>();

  Future<void> getBookList() async {
    try {
      final response = await AuthRepository.getBookList();
      listOfBooks = response;
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
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
      listOfBooks = response;
      Get.back(closeOverlays: true);
      getBookList();
      ToastUtils.showBottomSnackbar("${response.message}");
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
