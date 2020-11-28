import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class EtripServices extends GetxService {
  final box = GetStorage();
  final secStorage = FlutterSecureStorage();
  final FirebaseMessaging fcm = FirebaseMessaging();
  final picker = ImagePicker();

  @override
  void onInit() async {
    await GetStorage.init();
    await Firebase.initializeApp();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onInit();
  }

  @override
  void onReady() {
    WidgetsFlutterBinding.ensureInitialized();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
