import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/otp_sender.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupDriverController extends GetxController {
  var otp = ''.obs;
  var vId = ''.obs;
  TextEditingController email;
  TextEditingController number;
  TextEditingController name;
  TextEditingController confPass;
  TextEditingController password;
  var showText = true.obs;
  final formKey1 = GlobalKey<FormState>();
  var iconController = Icons.visibility_off.obs;

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
      number.text,
      vidUpdate,
    );

    await CustomNotifiers().submitOtp(
      otpSave: saveOtp,
      otpSend: submitOtp,
    );
  }

  Future doSignUp() async {
    await ApiCalls().postRequest(
      body: {
        "phone": number.text,
        "email": email.text,
        "name": name.text,
        "password": password.text,
      },
      headers: ApiData.jsonHeader,
      url: ApiData.driverSignUp,
    ).then((postData) async {
      print(postData);
      if (Get.isDialogOpen) {
        Get.back();
      }

      if (postData[0] == 201) {
        isPhone();
      } else {
        print(postData[0]);

        CustomNotifiers().snackBar(
          'Registration failed',
          'Email or Phone Number already exists',
          Icons.error,
        );
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
    email = TextEditingController();
    number = TextEditingController();
    name = TextEditingController();
    confPass = TextEditingController();
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
    number?.dispose();
    name?.dispose();
    password?.dispose();
    confPass?.dispose();
    super.onClose();
  }
}
