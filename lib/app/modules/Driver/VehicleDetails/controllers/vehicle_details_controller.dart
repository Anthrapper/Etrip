import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VehicleDetailsController extends GetxController {
  var vehicleData = [].obs;
  var items = <RxString>[].obs;
  var textController = <TextEditingController>[].obs;

  final vehicleDetailsKey = GlobalKey<FormState>();

  var isLoading = true.obs;
  Future getVehicleList() async {
    try {
      var vehicleList = await ApiCalls().getRequest(
        url: ApiData.registeredVehicles,
        header: await ApiData().getHeader(),
      );
      if (vehicleList != null) {
        vehicleData.assignAll(vehicleList);

        for (var i = 0; i <= vehicleData.length - 1; i++) {
          print(vehicleData[i]['name']);
          items.add(RxString());
          textController.add(TextEditingController());
        }

        isLoading.value = false;
      } else {
        throw Exception('Failed to load cars');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future uploadDocuments(String photo, String id, String number, int i) async {
    var uri = Uri.parse(ApiData.vehicleReg);
    print(photo);
    print(id);
    print(number);
    try {
      var req = http.MultipartRequest('POST', uri);
      req.headers.addAll(await ApiData().getHeader());
      req.files.add(
        await http.MultipartFile.fromPath('photo', photo),
      );
      req.fields['vehicle_no'] = number;
      req.fields['vehicle'] = id;
      var res = await req.send();
      print(res.reasonPhrase);
      print(res.statusCode);
      if (res.statusCode == 201) {
        if (vehicleData.length - 1 == i) {
          print('finished');
          await Get.find<EtripServices>().box.remove('is_document_cleared');
          if (Get.isDialogOpen) {
            Get.back();
          }
          Get.offAllNamed(AppPages.DRIVER_HOME);
        }
      }
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
    for (var i = 0; i <= vehicleData.length - 1; i++) {
      textController[i]?.dispose();
    }
    super.onClose();
  }
}
