import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewWorksController extends GetxController {
  var newWork = [].obs;
  var isLoading = true.obs;
  TextEditingController amount;
  Future setBid(String id) async {
    print(amount.text);
    await ApiCalls().postRequest(body: {
      "amount": amount.text,
      "trip": id,
    }, url: ApiData.createBid, headers: await ApiData().getHeader()).then(
        (value) {
      Get.back();
      amount.clear();

      if (value[0] == 201) {
        CustomNotifiers().snackBar(
          'Success',
          'A new bid has been created successfully',
          Icons.check,
        );
      }
    });
  }

  Future getNewWorks() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.newWork,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      if (value != null) {
        newWork.assignAll(value);
        isLoading.value = false;
      } else {
        getNewWorks();
      }
    });
  }

  @override
  void onInit() {
    amount = TextEditingController();
    getNewWorks();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    amount?.dispose();
    super.onClose();
  }
}
