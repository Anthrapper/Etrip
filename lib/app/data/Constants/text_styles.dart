import 'package:etrip/app/data/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomTextStyles {
  final appBar = TextStyle(
    color: Color(0xfff4f4f4),
    fontWeight: FontWeight.bold,
    fontSize: Get.height * 0.022,
  );
  final mlHome = TextStyle(
    color: (CustomColors.headings),
    fontSize: Get.height * 0.028,
  );
  final enHome = TextStyle(
    color: (CustomColors.headings),
    fontSize: Get.height * 0.031,
  );
  final drawer = TextStyle(
    color: (CustomColors.headings),
    fontSize: Get.height * 0.025,
    fontWeight: FontWeight.w400,
  );

  final headingStyle = TextStyle(
    color: (CustomColors.headings),
    fontSize: Get.height * 0.05,
    fontWeight: FontWeight.bold,
  );
  final medium = TextStyle(
    color: (CustomColors.headings),
    fontSize: Get.height * 0.03,
    fontWeight: FontWeight.w400,
  );
  final buttonTextStyle = TextStyle(
      color: (CustomColors.textColorThree), fontSize: Get.height * 0.024);
  final buttonTextStyle1 = TextStyle(
      color: (CustomColors.textColorThree), fontSize: Get.height * 0.0185);
  final textFieldStyle =
      TextStyle(color: (CustomColors.hintText), fontSize: Get.height * 0.0162);
  final smallText = TextStyle(
      color: (CustomColors.textColorOne), fontSize: Get.height * 0.0165);
  final smallButtonText = TextStyle(
      color: (CustomColors.textColorTwo), fontSize: Get.height * 0.0165);
  static const typeWriter =
      TextStyle(letterSpacing: 5, fontSize: 17, fontWeight: FontWeight.w400);
}
