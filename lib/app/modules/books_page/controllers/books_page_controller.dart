import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksPageController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;

  // RxList<String> bookList = ['abc', 'abcjh', 'bmbnj', 'hghjv'].obs;

  RxList<String> bookList = RxList<String>.empty(growable: true);

  @override
  void onInit() {
    bookList.addAll(['abc', 'abcjh', 'bmbnj', 'hghjv']);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.onInit();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }
}
