import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupDriverController extends GetxController {
  TextEditingController username;
  TextEditingController name;
  TextEditingController confPass;
  TextEditingController password;
  var showText = true.obs;
  final formKey = GlobalKey<FormState>();

  isPhone() async {
    print('phone');
    // OtpSender().onVerifyCode(
    //   username.text,
    // );
  }

  isEmail() async {
    print('mail');
    await Get.offAllNamed(AppPages.LOGIN);
    // CustomSnackbars().snackBar(
    //     'Success',
    //     'Your account has been created successfully. Activate your account by validating your email',
    //     Icons.check);
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
      if (postData[0] == 201) {
        GetUtils.isEmail(username.text) ? isEmail() : isPhone();
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
    username = TextEditingController();
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
    username?.dispose();
    name?.dispose();
    password?.dispose();
    confPass?.dispose();
    super.onClose();
  }
}
