import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult connectivityResult;
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    _initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    connectivityResult = await _connectivity.checkConnectivity();
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (kDebugMode) print("STATUS : $connectivityResult");

    if (connectivityResult == ConnectivityResult.none) {
      Get.showSnackbar(GetSnackBar(
          title: 'Internet Connection Lost!',
          messageText: const Text('Please try to connect with internet.',
              style: TextStyle(
                color: Colors.white,
              )),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red[400]!,
          isDismissible: true,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}