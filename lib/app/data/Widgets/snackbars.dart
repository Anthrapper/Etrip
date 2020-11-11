import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbars {
  Future progressIndicator() {
    return Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }

  Future snackBar(String title, String desc, IconData icon) async {
    return Get.snackbar(
      title,
      desc,
      backgroundColor: Colors.grey[400],
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      icon: Icon(icon),
      isDismissible: false,
    );
  }

  noInternet() {
    if (Get.isDialogOpen) {
      Get.back();
    }
    Get.snackbar(
      'Error Connecting',
      'Check Your Internet Connection',
      duration: Duration(seconds: 8),
      backgroundColor: Colors.blueGrey[100],
      icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar),
      isDismissible: false,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
