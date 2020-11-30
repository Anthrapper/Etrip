import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/storage_helper.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  TextEditingController userName;
  TextEditingController password;
  var deviceId = ''.obs;
  var showText = true.obs;
  var en = false.obs;
  var ml = false.obs;
  var devId = ''.obs;
  var iconController = Icons.visibility_off.obs;

  failedLogin(var reason) {
    if (Get.isDialogOpen) {
      Get.back();
    }
    CustomNotifiers().snackBar('Login Failed', reason.toString(), Icons.error);
  }

  Future getDeviceId() async {
    Get.find<EtripServices>().fcm.getToken().then(
      (String token) async {
        assert(token != null);
        devId.value = token;
        print(devId);
      },
    );
  }

  successfulLogin(var tokenData) async {
    await StorageHelper()
        .storeToken(tokenData['access'], tokenData['refresh'])
        .whenComplete(() async {
      if (Get.isDialogOpen) {
        Get.back();
        if (tokenData['user'] == 'driver') {
          await Get.find<EtripServices>().box.write('user_type', 'driver');
          if (tokenData['is_document_cleared'] == false) {
            await Get.find<EtripServices>()
                .box
                .write('is_document_cleared', false)
                .whenComplete(() => Get.offAllNamed(AppPages.DRIVER_DETAILS));
          } else {
            Get.offAllNamed(AppPages.DRIVER_HOME);
          }
          if (tokenData['user'] == 'user') {
            await Get.offAllNamed(AppPages.INITIAL);
          }
        } else {
          await Get.find<EtripServices>().box.write('user_type', 'user');

          await Get.offAllNamed(AppPages.INITIAL);
        }
      }
    });
  }

  Future login() async {
    print(devId);
    await ApiCalls().postRequest(
      body: {
        "username": userName.text,
        "password": password.text,
        "device_id": devId.value,
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

  Future enSelected() async {
    en.value = true;
    ml.value = false;
    await Get.find<EtripServices>().box.write('language', 'en').whenComplete(
          () => Get.updateLocale(
            Locale('en'),
          ),
        );
  }

  Future mlSelected() async {
    en.value = false;
    ml.value = true;

    await Get.find<EtripServices>().box.write('language', 'ml').whenComplete(
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
    if (await Get.find<EtripServices>().box.read('language') == null) {
      en.value = true;
      ml.value = false;
    } else if (await Get.find<EtripServices>().box.read('language') == 'en') {
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

    super.onInit();
  }

  @override
  void onReady() {
    langIntialize();
    getDeviceId();
    super.onReady();
  }

  @override
  void onClose() {
    userName?.dispose();
    password?.dispose();
    super.onClose();
  }
}
