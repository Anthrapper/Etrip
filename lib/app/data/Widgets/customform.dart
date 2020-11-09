import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool secureText;
  final Function validator;
  final bool suffixChecker;
  final Function obsecure;
  CustomTextField({
    this.hintText,
    this.icon,
    this.controller,
    this.secureText,
    this.validator,
    this.suffixChecker,
    this.obsecure,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.085),
      child: Container(
        decoration: BoxDecoration(
            color: HexColorUtils.getColorFromHex(CustomColors.textField),
            border: Border.all(
              color: HexColorUtils.getColorFromHex(CustomColors.textField),
            ),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.justify,
          controller: controller,
          cursorColor: Colors.blueGrey,
          obscureText: secureText,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: this.suffixChecker
                ? GestureDetector(
                    onTap: this.obsecure,
                    child: Icon(this.icon),
                  )
                : SizedBox(),
            prefixIcon: Padding(
              padding: EdgeInsets.only(),
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: CustomTextStyles().textFieldStyle,
          ),
        ),
      ),
    );
  }
}
