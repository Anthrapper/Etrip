import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/location_helper.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/User/vehicleform/controllers/vehicleform_controller.dart';
import 'package:etrip/app/modules/User/vehicleform/views/fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';

class VehicleformView extends GetView<VehicleformController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          'vehicleform'.tr,
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
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
        text: 'submit'.tr,
        onpressed: () {
          controller.submitForm();
        },
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CustomNotifiers().selectPlace(true);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.085),
                    child: Container(
                      // height: Get.height * 0.055,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: CustomColors.textField,
                          borderRadius: BorderRadius.circular(13)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.015,
                          left: Get.width * 0.1,
                          bottom: Get.height * 0.015,
                        ),
                        child: Obx(
                          () => Text(
                            controller.fromDes.value,
                            style: CustomTextStyles().textFieldStyle,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
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
              ),
            ],
          ),
          Obx(
            () => CustomField(
              onTap: () {
                CustomNotifiers().selectPlace(false);
              },
              text: controller.toDes.value,
            ),
          ),
          Obx(
            () => CustomField(
              onTap: () {
                controller.selectDate();
              },
              text: controller.readDate.value,
            ),
          ),
          Obx(
            () => CustomField(
              onTap: () {
                controller.pickTime();
              },
              text: controller.time.value,
            ),
          ),
        ],
      ),
    );
  }
}
