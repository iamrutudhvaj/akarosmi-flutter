import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddBookPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController authoreNameController = TextEditingController();
  TextEditingController publisherNameController = TextEditingController();

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
}
