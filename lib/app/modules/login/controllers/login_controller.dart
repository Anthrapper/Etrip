import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final box = GetStorage();
  final AuthHelper _authHelper = AuthHelper();
  TextEditingController userName;
  TextEditingController password;
  var deviceId = ''.obs;
  var showText = true.obs;
  var en = false.obs;
  var ml = false.obs;
  var iconController = Icons.visibility_off.obs;
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
        if (tokenData['user'] == 'driver') {
          if (tokenData['is_document_cleared'] == false) {
            await box
                .write('is_document_cleared', false)
                .whenComplete(() => Get.offAllNamed(AppPages.DRIVER_DETAILS));
          } else {
            await Get.offAllNamed(AppPages.INITIAL);
          }
        } else {
          await Get.offAllNamed(AppPages.INITIAL);
        }
      }
    });
  }

  Future login() async {
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(password.text);
      deviceId.value = token;
    });
    await ApiCalls().postRequest(
      body: {
        "username": userName.text,
        "password": password.text,
        "device_id": deviceId.value,
      },
      headers: ApiData.jsonHeader,
      url: ApiData.login,
    ).then(
      (postData) async {
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

  Future enSelected() async {
    en.value = true;
    ml.value = false;
    await box.write('language', 'en').whenComplete(
          () => Get.updateLocale(
            Locale('en'),
          ),
        );
  }

  Future mlSelected() async {
    en.value = false;
    ml.value = true;

    await box.write('language', 'ml').whenComplete(
          () => Get.updateLocale(
            Locale('ml'),
          ),
        );
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

  langIntialize() async {
    if (await box.read('language') == null) {
      en.value = true;
      ml.value = false;
    } else if (await box.read('language') == 'en') {
      en.value = true;
      ml.value = false;
    } else {
      ml.value = true;
      en.value = false;
    }
  }

  @override
  void onInit() async {
    userName = TextEditingController();
    password = TextEditingController();
    await langIntialize();

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
