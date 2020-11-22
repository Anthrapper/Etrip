import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleformController extends GetxController {
  var toCo = ''.obs;
  var fromDes = 'from'.tr.obs;
  var toDes = 'to'.tr.obs;
  var vehicleType = ''.obs;
  var readDate = 'date'.tr.obs;
  var time = 'Time'.obs;
  var passTime = ''.obs;
  var passDate = ''.obs;
  @override
  void onInit() {
    vehicleType.value = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future submitForm() async {
    print(toCo.value);
  }

  pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: Get.context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      time.value = t.format(Get.context);
      print(t);
    }
  }

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: Get.context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime(
        2082,
        08,
        30,
      ),
    );
    if (picked != null) {
      print(picked);
      passDate.value = picked.toString();
      readDate.value =
          picked.toString().substring(0, picked.toString().indexOf(' 0'));
    }
  }
}
