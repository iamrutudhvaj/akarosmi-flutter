import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastUtils {
  static void showBottomSnackbar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
