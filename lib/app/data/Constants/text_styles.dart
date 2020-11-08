import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomTextStyles {
  final headingStyle = TextStyle(
    color: HexColorUtils.getColorFromHex(CustomColors.headings),
    fontSize: Get.height * 0.05,
    fontWeight: FontWeight.bold,
  );
  final buttonTextStyle = TextStyle(
      color: HexColorUtils.getColorFromHex(CustomColors.textColorThree),
      fontSize: Get.height * 0.024);
  final textFieldStyle = TextStyle(
      color: HexColorUtils.getColorFromHex(CustomColors.hintText),
      fontSize: Get.height * 0.016);
  final smallText = TextStyle(
      color: HexColorUtils.getColorFromHex(CustomColors.textColorOne),
      fontSize: Get.height * 0.016);
  final smallButtonText = TextStyle(
      color: HexColorUtils.getColorFromHex(CustomColors.textColorTwo),
      fontSize: Get.height * 0.016);
}
