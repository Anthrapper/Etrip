import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleformController extends GetxController {
  var toCo = ''.obs;
  var fromCo = ''.obs;
  var fromDes = 'from'.tr.obs;
  var toDes = 'to'.obs;
  var vehicleType = ''.obs;
  var readDate = 'date'.tr.obs;
  var time = 'Time'.obs;
  var passTime = ''.obs;

  Future createNewTrip() async {
    print(fromCo);
    print(toCo);
    var date = readDate.value + ' ' + passTime.value;
    print(date);
    await ApiCalls().postRequest(
      body: {
        "from_place_coordinates": fromCo.value,
        "to_place_coordinates": toCo.value,
        "date": date,
        "from_place": fromDes.value,
        "to_place": toDes.value,
      },
      headers: await ApiData().getHeader(),
      url: ApiData.newTrip,
    ).then((value) {
      if (value[0] == 201) {
        //TODO nav
        CustomNotifiers()
            .snackBar('Success', 'Trip has been successfully', Icons.check);
      }
    });
  }

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

  pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: Get.context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      time.value = t.format(Get.context);

      passTime.value = t.toString().substring(10, 15) + ':00';
      print(passTime);
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
      readDate.value =
          picked.toString().substring(0, picked.toString().indexOf(' 0'));
    }
  }
}
//2020-11-2416:16:00

//2020-11-22 20:34:50
