import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  CustomButton({@required this.text, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.buttonColor,
      height: Get.height * 0.055,
      width: Get.width * 0.4,
      child: FlatButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: CustomTextStyles().buttonTextStyle,
        ),
      ),
    );
  }
}
