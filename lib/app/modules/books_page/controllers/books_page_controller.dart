import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksPageController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void onInit() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.onInit();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
