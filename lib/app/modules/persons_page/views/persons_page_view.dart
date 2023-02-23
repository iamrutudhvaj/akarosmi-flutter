import 'package:akarosmi/app/core/theme/color.dart';
import 'package:akarosmi/app/core/theme/style.dart';
import 'package:akarosmi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/persons_page_controller.dart';

class PersonsPageView extends GetView<PersonsPageController> {
  const PersonsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Add Person',
            style: Styles.normal(22, color: AppColors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.ADD_PERSON_DETAILS_PAGE);
              },
              icon: Icon(
                Icons.person_add,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
          elevation: 0,
        ),
        body: Column(
          children: const [],
        ));
  }
}
