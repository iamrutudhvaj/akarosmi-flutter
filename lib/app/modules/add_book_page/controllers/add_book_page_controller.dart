import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/data/model/request_model/add_book_request_model.dart';
import 'package:akarosmi/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/toast.dart';
import '../../../data/network/api_controller.dart';
import '../../../data/repository/auth_repository.dart';

class AddBookPageController extends GetxController {
  AppController appController = Get.find();
  HomePageController homePageController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController authoreNameController = TextEditingController();
  TextEditingController publisherNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _imagePathList = List<XFile?>.empty().obs;
  List<XFile?> get imagePathList => _imagePathList;
  set imagePathList(List<XFile?> value) => _imagePathList.value = value;

  dynamic image;

  Future<void> getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    imagePathList.add(image);
    Get.back();
  }

  String? bookId;
  late int? index;

  @override
  void onInit() {
    index = Get.arguments;
    if (index != null) {
      authoreNameController.text =
          appController.listOfBooks[index!].author ?? '';
      nameController.text = appController.listOfBooks[index!].name ?? '';
      publisherNameController.text =
          appController.listOfBooks[index!].publisher ?? '';
      bookId = appController.listOfBooks[index!].bookId ?? '';
    }
    super.onInit();
  }

  Future<void> addBook() async {
    List<String>? list = <String>[];
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      list = await uploadAsset();

      final response = await AuthRepository.addBook(
          requestData: AddBookRequestModel(
        author: authoreNameController.text,
        name: nameController.text,
        publisher: publisherNameController.text,
        image: list,
      ));
      ToastUtils.showBottomSnackbar("${response["message"]}");
      await homePageController.getBookList();
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }

  Future<List<String>?> uploadAsset() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await ApiController.uploadFile(imagePathList);
      Get.back(closeOverlays: true);
      return response;
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
    return null;
  }

  Future<void> editBook() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await AuthRepository.editBook(
          requestData: AddBookRequestModel(
            author: authoreNameController.text,
            name: nameController.text,
            publisher: publisherNameController.text,
          ),
          bookID: bookId!);
      ToastUtils.showBottomSnackbar("${response["message"]}");
      await homePageController.getBookList();
      index = null;
      Get.back(closeOverlays: true);
    } on DioError catch (e) {
      Get.back();
      ToastUtils.showBottomSnackbar("${(e.response?.data as Map)["message"]}");
    } catch (e) {
      Get.back();
    }
  }
}
