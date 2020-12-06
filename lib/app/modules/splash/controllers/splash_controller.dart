import 'dart:async';

import 'package:etrip/app/data/Functions/auth_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  checkAuth() async {
    Timer(
        Duration(
          milliseconds: 3200,
        ), () async {
      await AuthHelper().authenticationChecking();
    });
  }

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
