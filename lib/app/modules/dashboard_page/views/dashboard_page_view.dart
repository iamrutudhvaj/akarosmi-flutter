import 'package:akarosmi/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';

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
    );
  }
}
