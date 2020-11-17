import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/location_helper.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/User/vehicleform/controllers/vehicleform_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleformView extends GetView<VehicleformController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        title: Text('VEHICLE FORM'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading(),
            form(),
            button(),
          ],
        ),
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.08, 0, 0),
      child: Text(
        controller.vehicleType.value,
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
        text: 'Submit',
        onpressed: () {},
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
      child: Form(
        key: controller.vehicleKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.001),
                    child: CustomTextField(
                      suffixChecker: false,
                      controller: controller.from,
                      hintText: 'From',
                      secureText: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: Get.width * 0.085),
                  child: IconButton(
                    icon: Icon(Icons.gps_fixed),
                    color: CustomColors.buttonColor,
                    iconSize: Get.width * 0.075,
                    onPressed: () {
                      LocationHelper().getUserLocation();
                    },
                  ),
                  // child: Icon(
                  //   Icons.gps_fixed,
                  //   color: CustomColors.buttonColor,
                  // ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomTextField(
                suffixChecker: true,
                controller: controller.to,
                hintText: 'To',
                secureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomTextField(
                suffixChecker: true,
                controller: controller.to,
                hintText: 'Date',
                secureText: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
