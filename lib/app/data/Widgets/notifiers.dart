import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/imagepicker.dart';
import 'package:etrip/app/modules/User/vehicleform/controllers/vehicleform_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:search_map_place/search_map_place.dart';
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
                'Please enter 4-digit code sent to your number as SMS',
                textAlign: TextAlign.center,
                style: CustomTextStyles().smallText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: CustomButton(
                  text: 'SUBMIT',
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
        height: Get.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: Column(
            children: <Widget>[
              Text(
                'Upload From :',
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
                  title: Text('Camera'),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  val.value = await ImagePick().getImageFromGallery();
                },
                child: ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectPlace(bool fromCheck){
    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(
          Get.height * 0.02
        ),
        height: Get.height * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
             top: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: SearchMapPlaceWidget(
            iconColor: CustomColors.buttonColor,
            language: 'en',
            apiKey: 'AIzaSyDVlIcJGpqZrY6UCC7s3YTIy22V9jTl7Cg',
            hasClearButton: true,
            placeType: PlaceType.address,
            onSelected: (place) async{
              Geolocation geolocation = await place.geolocation;
             await print(place.description);
             await print(place.fullJSON);
             await print(place.placeId);
             await print(geolocation.coordinates);
             if(fromCheck == true) {
                Get.find<VehicleformController>().fromDes.value =
                    await place.description;
              }
             else{
               Get.find<VehicleformController>().toDes.value =
               await place.description;
             }
            },
            // location: (9.7108379, 76.4860073),
          ),
        ),
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
