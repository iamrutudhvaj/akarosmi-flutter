import 'package:akarosmi/app/data/model/request_model/add_book_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/toast.dart';
import '../../../data/repository/auth_repository.dart';
import '../../books_page/controllers/books_page_controller.dart';

class AddBookPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController authoreNameController = TextEditingController();
  TextEditingController publisherNameController = TextEditingController();
  final bookPageController = Get.find<BooksPageController>();

  final _imagePath = Rx<XFile?>(null);
  XFile? get imagePath => _imagePath.value;
  set imagePath(XFile? value) => _imagePath.value = value;

  Future<void> getImage({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = image;
    imagePath = imageTemporary;
    Get.back();
  }

  String? name;

  @override
  void onInit() {
    name = Get.arguments;
    super.onInit();
  }

  Future<void> addBook() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.addBook(
          requestData: AddBookRequestModel(
        author: authoreNameController.text,
        name: nameController.text,
        publisher: publisherNameController.text,
      ));
      ToastUtils.showBottomSnackbar("${response["message"]}");
      bookPageController.userListOfBookData();
      Get.back();
      Get.back();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

   Future<void> editBook({required String id}) async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.editBookData(
          requestData: AddBookRequestModel(
        author: authoreNameController.text,
        name: nameController.text,
        publisher: publisherNameController.text,
      ),bookID: id);
      ToastUtils.showBottomSnackbar("${response["message"]}");
      bookPageController.userListOfBookData();
      Get.back();
      Get.back();
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
