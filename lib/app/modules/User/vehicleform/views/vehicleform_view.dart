import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/location_helper.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/User/vehicleform/controllers/vehicleform_controller.dart';
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
          'Vehicle Form',
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

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: Get.context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime(
        2022,
        08,
        30,
      ),
    );
    if (picked != null) {
      print(picked);
      controller.passDate.value = picked.toString();
      controller.readDate.value =
          picked.toString().substring(0, picked.toString().indexOf(' 0'));
    }
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
                // TODO: Add a FlatButton instead of the GestureDetector
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
          GestureDetector(
            onTap: () {
              CustomNotifiers().selectPlace(false);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: EdgeInsets.only(right: Get.width * 0.001),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.085),
                  child: Container(
                    height: Get.height * 0.055,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: CustomColors.textField,
                        borderRadius: BorderRadius.circular(13)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.015,
                        left: Get.width * 0.1,
                      ),
                      child: Obx(
                        () => Text(
                          controller.toDes.value,
                          style: CustomTextStyles().textFieldStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _selectDate();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: EdgeInsets.only(right: Get.width * 0.001),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.085),
                  child: Container(
                    height: Get.height * 0.055,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: CustomColors.textField,
                        borderRadius: BorderRadius.circular(13)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.015,
                        left: Get.width * 0.1,
                      ),
                      child: Obx(
                        () => Text(
                          controller.readDate.value,
                          style: CustomTextStyles().textFieldStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
