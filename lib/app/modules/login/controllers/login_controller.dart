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
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final box = GetStorage();
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


  //
  // _firebaseMessaging.requestNotificationPermissions(
  // const IosNotificationSettings(sound: true, badge: true, alert: true));
  // _firebaseMessaging.onIosSettingsRegistered
  //     .listen((IosNotificationSettings settings) {
  // print("Settings registered: $settings");
  // });
  // _firebaseMessaging.getToken().then((String token) {
  // assert(token != null);
  // print(token);
  // firebaseToken = token;
  // setState(() => {});
  // });

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
    await ApiCalls().postRequest(
      body: {
        "username": userName.text,
        "password": password.text,
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

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message ${message}');
        // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
        // displayNotification(message);
        // _showItemDialog(message);
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
     });
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
