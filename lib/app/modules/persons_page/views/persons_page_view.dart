import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../controllers/persons_page_controller.dart';

class PersonsPageView extends GetView<PersonsPageController> {
  const PersonsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'PersonsPageView',
          style: Styles.normal(
            20,
            color: AppColors.black,
          ),
        ),
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
