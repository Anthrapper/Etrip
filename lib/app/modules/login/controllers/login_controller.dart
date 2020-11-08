import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email;
  TextEditingController password;
  var showText = true.obs;
  var en = true.obs;
  var ml = false.obs;
  final formKey = GlobalKey<FormState>();
  Future dologin() async {
    print('logged in');
  }

  enSelected() {
    en.value = true;
    ml.value = false;
    print('english selected, $en');
  }

  mlSelected() {
    en.value = false;
    ml.value = true;
    print('ml selected, $ml');
  }

  obscure() {
    print('called ');
    print(showText.value);

    if (showText.value == false) {
      showText.value = true;
    } else {
      showText.value = false;
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    email?.dispose();
    password?.dispose();
    super.onClose();
  }
}
