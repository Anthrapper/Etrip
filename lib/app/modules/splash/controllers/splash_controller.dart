import 'dart:async';

import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future checkAuth() async {
    AuthHelper().checkLoginStatus();
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
