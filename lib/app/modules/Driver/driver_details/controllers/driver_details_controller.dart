import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
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
    try {
      var req = http.MultipartRequest('PUT', uri);
      req.headers.addAll(await ApiData().getHeader());
      req.files.add(
        await http.MultipartFile.fromPath('photo', photo.value),
      );
      req.files.add(
          await http.MultipartFile.fromPath('license_back', licenseBack.value));
      req.files.add(await http.MultipartFile.fromPath(
          'license_front', licenseFront.value));
      var res = await req.send();
      print(res.reasonPhrase);
      print(res.statusCode);
      if (Get.isDialogOpen) {
        Get.back();
      }
      if (res.statusCode == 200) {
        await fieldUpload();
      }
    } on Exception catch (e) {
      CustomNotifiers().snackBar('Error', e.toString(), Icons.error);
    }
  }

  Future fieldUpload() async {
    var k = StringBuffer();
    myActivities.forEach((item) {
      k.write("vehicles=" + item.toString() + "&");
    });
    var k2 = k.toString();
    print(k2);

    try {
      var response = await http.put(
        ApiData.driverDetails,
        headers: await ApiData().contentHeader(),
        body: k2,
      );
      print(response.statusCode);
      print(response.body);
      //TODO vehicle picture upload
    } on Exception catch (e) {
      CustomNotifiers().snackBar('Error', e.toString(), Icons.error);
    }
  }

  @override
  void onInit() {
    getVehicleList();
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
