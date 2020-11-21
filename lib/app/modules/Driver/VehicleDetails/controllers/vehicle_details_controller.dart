import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleDetailsController extends GetxController {
  var vehicleData = [].obs;
  var isLoading = true.obs;
  Future getVehicleList() async {
    try {
      var vehicleList = await ApiCalls().getRequest(
        url: ApiData.registeredVehicles,
        header: await ApiData().getHeader(),
      );
      if (vehicleList != null) {
        vehicleData.assignAll(vehicleList);
        isLoading.value = false;
      } else {
        throw Exception('Failed to load cars');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getVehicleList();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
