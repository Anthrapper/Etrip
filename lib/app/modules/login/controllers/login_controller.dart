import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthHelper _authHelper = AuthHelper();
  TextEditingController userName;
  TextEditingController password;
  var showText = true.obs;
  var en = true.obs;
  var ml = false.obs;
  failedLogin(var reason) {
    if (Get.isDialogOpen) {
      Get.back();
    }
    CustomNotifiers().snackBar('Login Failed', reason.toString(), Icons.error);
  }

  successfulLogin(var tokenData) async {
    await _authHelper
        .storeToken(tokenData['access'], tokenData['refresh'])
        .whenComplete(() async {
      if (Get.isDialogOpen) {
        Get.back();
        await Get.offAllNamed(AppPages.INITIAL);
      }
    });
  }

  Future login() async {
    await ApiCalls().postRequest(
      body: {
        "username": userName.text,
        "password": password.text,
        "_mutable": 1
      },
      headers: ApiData.jsonHeader,
      url: ApiData.login,
    ).then(
      (postData) async {
        print(postData);
        if (postData[0] == 200) {
          successfulLogin(postData[1]);
        } else if (postData[0] == 401) {
          failedLogin(postData[1]['detail']);
        } else {
          print(postData[0]);
          failedLogin(postData[1]);
        }
      },
    );
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
    userName = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userName?.dispose();
    password?.dispose();
    super.onClose();
  }
}
