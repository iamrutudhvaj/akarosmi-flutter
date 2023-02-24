import 'package:akarosmi/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:akarosmi/app/modules/dashboard_page/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          'DashboardPageView',
          style: Styles.regular(
            20,
            color: AppColors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "${StorageService.getToken()}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
