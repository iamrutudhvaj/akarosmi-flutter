import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/persons_page_controller.dart';

class PersonsPageView extends GetView<PersonsPageController> {
  const PersonsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonsPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PersonsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
