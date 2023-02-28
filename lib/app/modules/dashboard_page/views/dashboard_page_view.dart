import 'package:akarosmi/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:akarosmi/app/core/service/storage_service.dart';
import 'package:akarosmi/app/modules/dashboard_page/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      body: Center(
        child: Text(
          "${StorageService.getToken()}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
