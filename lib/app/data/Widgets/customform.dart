import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool secureText;
  final Function validator;
  final Function obsecure;
  CustomTextField({
    @required this.hintText,
    this.icon,
    @required this.controller,
    @required this.secureText,
    @required this.validator,
    this.obsecure,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.085),
      child: TextFormField(
        autofocus: false,
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.justify,
        controller: controller,
        cursorColor: Colors.blueGrey,
        obscureText: secureText,
        validator: validator,
        decoration: InputDecoration(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.textField),
            borderRadius: BorderRadius.circular(13),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.textField),
            borderRadius: BorderRadius.circular(13),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.textField),
            borderRadius: BorderRadius.circular(13),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.textField),
            borderRadius: BorderRadius.circular(13),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.textField),
            borderRadius: BorderRadius.circular(13),
          ),
          filled: true,
          fillColor: CustomColors.textField,
          suffixIcon: this.obsecure != null
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
    );
  }
}
