import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  final Function onpressed;
  CustomButton1({@required this.text, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.04,
      width: Get.width * 0.38,
      decoration: BoxDecoration(
        // color: HexColorUtils.getColorFromHex(CustomColors.buttonColor1),
        color: CustomColors.buttonColor2,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            offset: Offset(2, 5),
          ),
        ],
      ),
      child: FlatButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: CustomTextStyles().buttonTextStyle1,
        ),
      ),
    );
  }
}
