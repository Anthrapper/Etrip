import 'dart:async';

import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/otp_sender.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var otp = ''.obs;
  var iconController = Icons.visibility.obs;

  var vId = ''.obs;
  TextEditingController username;
  TextEditingController name;
  TextEditingController confPass;
  TextEditingController password;
  var showText = true.obs;
  final regKey = GlobalKey<FormState>();

  vidUpdate(String verificationId) {
    vId.value = verificationId;
  }

  saveOtp(String pin) {
    otp.value = pin;
    print(pin);
  }

  submitOtp() {
    OtpSender().onFormSubmitted(otp.value, vId.value);
  }

  isPhone() async {
    OtpSender().onVerifyCode(
      username.text,
      vidUpdate,
    );
    await CustomNotifiers().submitOtp(
      otpSave: saveOtp,
      otpSend: submitOtp,
    );
  }

  isEmail() async {
    CustomNotifiers().snackBar(
        'Success',
        'Your account has been created successfully, Please check your inbox for activating your account. This may take upto 5 minutes',
        Icons.check_box);

    Future.delayed(Duration(milliseconds: 3000), () {
      Get.offAllNamed(AppPages.LOGIN);
    });
  }

  Future doSignUp() async {
    await ApiCalls().postRequest(
      body: {
        "username": username.text,
        "name": name.text,
        "password": password.text,
      },
      headers: ApiData.jsonHeader,
      url: ApiData.signUp,
    ).then((postData) async {
      print(postData);

      if (Get.isDialogOpen) {
        Get.back();
      }

      if (postData[0] == 201) {
        GetUtils.isEmail(username.text) ? isEmail() : isPhone();
      } else {
        print(postData[0]);
        CustomNotifiers().snackBar('Registration failed',
            'Email or Phone Number already exists', Icons.error);
      }
    });
  }

  obscure() {
    if (showText.value == false) {
      showText.value = true;
      iconController.value = Icons.visibility_off;
    } else {
      showText.value = false;
      iconController.value = Icons.visibility;
    }
  }

  @override
  void onInit() {
    super.onInit();

    username = TextEditingController();
    name = TextEditingController();
    confPass = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    username?.dispose();
    name?.dispose();
    password?.dispose();
    confPass?.dispose();
    super.onClose();
  }
}
