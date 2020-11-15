import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDetailsController extends GetxController {
  var otp = ''.obs;
  var vId = ''.obs;
  TextEditingController licenseNum;

  var showText = true.obs;
  var en = true.obs;
  var ml = false.obs;
  final formKey2 = GlobalKey<FormState>();

  vidUpdate(String verificationId) {
    vId.value = verificationId;
  }

  // isPhone() async {
  //   OtpSender().onVerifyCode(
  //     username.text,
  //     vidUpdate,
  //   );
  //   await CustomNotifiers().submitOtp(
  //     otpSave: saveOtp,
  //     otpSend: submitOtp,
  //   );
  // }

  isLicenseNumber() {
    print('License Number');
  }

  Future doDetailsSubmit() async {
    await ApiCalls().postRequest(
      body: {
        // "username": username.text,
      },
      headers: ApiData.jsonHeader,
      url: ApiData.driverDetails,
    ).then((postData) async {
      print(postData);

      if (Get.isDialogOpen) {
        Get.back();
      }
      if (postData[0] == 201) {
        isLicenseNumber();
      } else {
        print(postData[0]);
      }
    });
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
    licenseNum = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    licenseNum?.dispose();
    super.onClose();
  }
}
