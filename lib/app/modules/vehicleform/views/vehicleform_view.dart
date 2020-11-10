import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/vehicleform/controllers/vehicleform_controller.dart';

class VehicleformView extends GetView<VehicleformController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CustomTextField(
              suffixChecker: false,
              controller: controller.from,
              hintText: 'From',
              secureText: false,
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
