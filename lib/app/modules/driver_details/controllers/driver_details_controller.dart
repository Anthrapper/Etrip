import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDetailsController extends GetxController {
  List myActivities = [].obs;
  var vehicleData = [].obs;

  var otp = ''.obs;
  var vId = ''.obs;
  TextEditingController licenseNum;

  var showText = true.obs;
  var en = true.obs;
  var ml = false.obs;
  final formKey2 = GlobalKey<FormState>();

  vidUpdate(String verificationId) {
    vId.value = verificationId;
  }

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


  // manualVerify(String filename) async {
  //   print(filename);
  //
  //   var uri = Uri.parse(ApiData.driverDetails);
  //   var req = http.MultipartRequest('POST', uri);
  //   req.files
  //       .add(await http.MultipartFile.fromPath('verification_file', filename));
  //   req.fields['token'] = sharedPreferences.getString('token');
  //   var res = await req.send();
  //   print(res.reasonPhrase);
  //   print(res.statusCode);
  //   if (res.statusCode == 201) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //
  //     _onAlertButtonPressed(context);
  //   } else if (res.statusCode == 400) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     _errorMessage(context);
  //   }
  // }


  @override
  void onInit() {
    // getVehicleList();
    licenseNum = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    licenseNum?.dispose();
    super.onClose();
  }
}
