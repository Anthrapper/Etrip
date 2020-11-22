import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  Future checkAuth() async {
    AuthHelper().checkLoginStatus();
  }

  final storage = FlutterSecureStorage();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final box = GetStorage();
  var deviceId = ''.obs;

  Future getDeviceId() async {
    _firebaseMessaging.getToken().then((String token) async {
      assert(token != null);
      deviceId.value = token;
      await storage.write(key: 'deviceId', value: deviceId.toString());
    });
  }

  @override
  void onInit() {
    getDeviceId();
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
