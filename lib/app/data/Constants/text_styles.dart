import 'package:etrip/app/data/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomTextStyles {
  final headingStyle = TextStyle(
    color: (CustomColors.headings),
    fontSize: Get.height * 0.05,
    fontWeight: FontWeight.bold,
  );
  final buttonTextStyle = TextStyle(
      color: (CustomColors.textColorThree), fontSize: Get.height * 0.024);
  final buttonTextStyle1 = TextStyle(
      color: (CustomColors.textColorThree), fontSize: Get.height * 0.02);
  final textFieldStyle =
      TextStyle(color: (CustomColors.hintText), fontSize: Get.height * 0.016);
  final smallText = TextStyle(
      color: (CustomColors.textColorOne), fontSize: Get.height * 0.016);
  final smallButtonText = TextStyle(
      color: (CustomColors.textColorTwo), fontSize: Get.height * 0.016);
}
