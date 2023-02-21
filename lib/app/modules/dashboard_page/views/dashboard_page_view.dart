import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
