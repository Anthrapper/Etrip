import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DriverDetailsController extends GetxController {
  var photo = "".obs;
  var licenseFront = "".obs;
  var licenseBack = "".obs;
  List myActivities = [].obs;
  var vehicleData = [].obs;
  var showWidget = false.obs;
  final formKey2 = GlobalKey<FormState>();
  Future getVehicleList() async {
    try {
      var vehicleList = await ApiCalls().getRequest(
        url: ApiData.vehiclesList,
        header: await ApiData().getHeader(),
      );
      if (vehicleList != null) {
        print(vehicleList);
        vehicleData.assignAll(vehicleList);
        showWidget.value = true;
      } else {
        throw Exception('Failed to load cars');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  photoUpload() async {
    var uri = Uri.parse(ApiData.driverDetails);
    print(uri);
    var req = http.MultipartRequest('POST', uri);
    req.headers.addAll(await ApiData().getHeader());
    req.files.add(
      await http.MultipartFile.fromPath('photo', photo.value),
    );
    // req.files.add(
    //     await http.MultipartFile.fromPath('license_back', licenseBack.value));
    // req.files.add(
    //     await http.MultiparztFile.fromPath('license_front', licenseFront.value));
    // req.fields["vehicles"] = [1, 2].toString();
    var res = await req.send();
    print(res.reasonPhrase);
    print(res.statusCode);
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
