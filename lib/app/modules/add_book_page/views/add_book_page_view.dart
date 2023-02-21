import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_page_controller.dart';

class AddBookPageView extends GetView<AddBookPageController> {
  const AddBookPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'AddBookPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
