import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/imagepicker.dart';
import 'package:etrip/app/modules/Driver/new_works/controllers/new_works_controller.dart';
import 'package:etrip/app/modules/User/bids/controllers/bids_controller.dart';
import 'package:etrip/app/modules/User/vehicleform/views/search_place_widget.dart';
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
                'uploadfrm'.tr + ' :',
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

  areYouSure() {
    return Get.dialog(
      Center(
        child: Container(
          height: Get.height * 0.4,
          width: Get.width * 0.8,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                blurRadius: 20.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Are you sure you want to select this bid?',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text(
                    'Once selected it cannot be changed!',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.05,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          color: CustomColors.buttonColor1,
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Get.find<BidsController>().selectBid();
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          width: Get.width * 0.35,
                          height: Get.height * 0.05,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            color: Color(0xffB82424),
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setBidAmount(Function confirm) {
    return Get.dialog(
      Center(
        child: Container(
          height: Get.height * 0.4,
          width: Get.width * 0.8,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                blurRadius: 20.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: TextFormField(
                          decoration: new InputDecoration(hintText: "Amount"),
                          autofocus: true,
                          controller: Get.find<NewWorksController>().amount,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Text(
                      'Once selected it cannot be changed!',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width * 0.35,
                          height: Get.height * 0.05,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            color: CustomColors.buttonColor1,
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              confirm();
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: Get.width * 0.35,
                            height: Get.height * 0.05,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              color: Color(0xffB82424),
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  tripCompletedDialog(Function confirm) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                blurRadius: 20.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          height: Get.height * 0.33,
          width: Get.width * 0.8,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Are you sure that the trip is completed?',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 15, 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.35,
                        height: Get.height * 0.05,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: CustomColors.buttonColor1,
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            confirm();
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          width: Get.width * 0.35,
                          height: Get.height * 0.05,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            color: Color(0xffB82424),
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
