import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleformController extends GetxController {
  TextEditingController from;
  TextEditingController to;
  TextEditingController date;
  var fromDes = 'From'.obs;
  var toDes = 'To'.obs;
  var vehicleType = ''.obs;
  var readDate = 'Date'.obs;
  var passDate = ''.obs;
  final vehicleKey = GlobalKey<FormState>();
  @override
  void onInit() {
    vehicleType.value = Get.arguments;
    from = TextEditingController();
    to = TextEditingController();
    date = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    from?.dispose();
    to?.dispose();
    date?.dispose();
  }
}
