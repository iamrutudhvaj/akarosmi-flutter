import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'DashboardPageView',
          style: Styles.normal(
            20,
            color: AppColors.black,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'DashboardPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
