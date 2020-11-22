import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomField extends StatelessWidget {
  final Function onTap;
  final String text;
  CustomField({this.onTap, this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Padding(
          padding: EdgeInsets.only(right: Get.width * 0.001),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.085),
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
                  right: Get.width * 0.1,
                  bottom: Get.height * 0.015,
                ),
                child: Text(
                  text,
                  style: CustomTextStyles().textFieldStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
