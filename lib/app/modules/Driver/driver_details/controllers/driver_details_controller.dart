import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class DriverDetailsController extends GetxController {
  var photo = "".obs;
  var licenseFront = "".obs;
  var licenseBack = "".obs;

  List myActivities = [].obs;
  var vehicleData = [].obs;

  final formKey2 = GlobalKey<FormState>();


  Future getVehicleList() async {
    try {
      var vehicleList = await ApiCalls().getRequest(
        url: ApiData.vehiclesList,
        header: await ApiData().getHeader(),
      );
      if (vehicleList != null) {
        print(vehicleList);
        vehicleData.value = vehicleList;
      } else {
        throw Exception('Failed to load cars');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  photoUpload() async {
    var uri = Uri.parse(ApiData.driverDetails);
    var req = http.MultipartRequest('POST', uri);
    req.files.add(await http.MultipartFile.fromPath('photo', photo.value));
    req.files.add(
        await http.MultipartFile.fromPath('license_back', licenseBack.value));
    req.files.add(
        await http.MultipartFile.fromPath('license_front', licenseFront.value));
    // req.fields['token'] = sharedPreferences.getString('token');
    var res = await req.send();
    print(res.reasonPhrase);
    print(res.statusCode);
  }

  @override
  void onInit() {
    // getVehicleList();
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
}
