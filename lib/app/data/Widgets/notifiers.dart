import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/imagepicker.dart';
import 'package:etrip/app/modules/User/vehicleform/controllers/search_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'customwidgets.dart';

class CustomNotifiers {
  Future progressIndicator() {
    return Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }

  Future submitOtp({Function otpSave, Function otpSend}) async {
    await Get.bottomSheet(
      Container(
        height: Get.height * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PinEntryTextField(
                fields: 6,
                fieldWidth: Get.width / 10,
                fontSize: 30.0,
                showFieldAsBox: false,
                onSubmit: (String pin) {
                  otpSave(pin);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'otpprompt'.tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles().smallText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: CustomButton(
                  text: 'submit'.tr,
                  onpressed: otpSend,
                ),
              ),
            ),
          ],
        ),
      ),
      isDismissible: false,
    );
  }

  Future snackBar(String title, String desc, IconData icon) async {
    return Get.snackbar(
      title,
      desc,
      backgroundColor: Colors.grey[400],
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      icon: Icon(icon),
      isDismissible: false,
    );
  }

  uploadSelection(RxString val) {
    return Get.bottomSheet(
      Container(
        height: Get.height * 0.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'uploadfrm' +' :',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  val.value = await ImagePick().getImageFromCamera();
                },
                child: ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('camera'.tr),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  val.value = await ImagePick().getImageFromGallery();
                },
                child: ListTile(
                  leading: Icon(Icons.image),
                  title: Text('gallery'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectPlace(bool fromCheck) {
    return Get.bottomSheet(
      SearchWidget(
        fromCheck: fromCheck,
      ),
    );
  }

  noInternet() {
    if (Get.isDialogOpen) {
      Get.back();
    }
    Get.snackbar(
      'Error Connecting',
      'Check Your Internet Connection',
      duration: Duration(seconds: 8),
      backgroundColor: Colors.blueGrey[100],
      icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar),
      isDismissible: false,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
