import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/core/theme/color.dart';
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

  String? selectedStatus;

  final _imagePathList = List<XFile?>.empty().obs;
  List<XFile?> get imagePathList => _imagePathList;
  set imagePathList(List<XFile?> value) => _imagePathList.value = value;

  final _imageUploadList = <String>[].obs;
  List<String> get imageUploadList => _imageUploadList;
  set imageUploadList(List<String> value) => _imageUploadList.value = value;

  dynamic image;
  String? status;

  Future<void> getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    imagePathList.add(image);
    var data = await uploadAsset();
    if (data != null) {
      imageUploadList.add(data);
    }
    Get.back();
  }

  String? bookId;
  late int? index;

  @override
  void onInit() {
    index = Get.arguments;

    if (index != null) {
      var book = appController.listOfBooks[index!];
      authoreNameController.text = book.author ?? '';
      nameController.text = book.name ?? '';
      publisherNameController.text = book.publisher ?? '';
      bookId = book.bookId ?? '';
      imageUploadList = book.images ?? [];
      if (book.status == '1') {
        selectedStatus = 'Available';
      } else if (book.status == '2') {
        selectedStatus = 'Allocated';
      } else {
        selectedStatus = 'Away';
      }
    }
    super.onInit();
  }

  Future<void> addBook() async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.white,
          ),
        ),
        barrierDismissible: false,
      );

      final response = await AuthRepository.addBook(
          requestData: AddBookRequestModel(
        author: authoreNameController.text,
        name: nameController.text,
        publisher: publisherNameController.text,
        image: imageUploadList,
        status: "1",
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

  Future<String?> uploadAsset() async {
    try {
      Get.dialog(
        Center(
          child: CupertinoActivityIndicator(
            color: AppColors.white,
          ),
        ),
        barrierDismissible: false,
      );
      final response = await ApiController.uploadFile([imagePathList.last]);
      Get.back();
      return response?.first;
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
      if (selectedStatus == 'Available') {
        status = "1";
      } else if (selectedStatus == 'Allocated') {
        status = "2";
      } else {
        status = "3";
      }
      final response = await AuthRepository.editBook(
          requestData: AddBookRequestModel(
            author: authoreNameController.text,
            name: nameController.text,
            publisher: publisherNameController.text,
            image: imageUploadList,
            status: status,
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
