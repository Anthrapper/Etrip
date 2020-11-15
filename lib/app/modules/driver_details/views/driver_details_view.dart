import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:etrip/app/data/Widgets/customButton.dart';
import 'package:etrip/app/data/Widgets/customform.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:etrip/app/modules/driver_details/controllers/driver_details_controller.dart';

class DriverDetailsView extends GetView<DriverDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColorUtils.getColorFromHex(
        CustomColors.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logo(),
              heading(),
              form(),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.03, bottom: Get.height * 0.05),
                child: button(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.08, 0, 0),
      child: CircleAvatar(
        backgroundColor: HexColorUtils.getColorFromHex(
          CustomColors.circleAvatar,
        ),
        radius: Get.width * 0.11,
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.01, 0, 0),
      child: Text(
        'Sign Up',
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(text: 'Submit', onpressed: () {}),
    );
  }

  Widget form() {
    return Padding(
      padding:
      EdgeInsets.only(top: Get.height * 0.1, bottom: Get.height * 0.03),
      child: Form(
        // key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: true,
                // controller: controller.username,
                hintText: 'Enter license number',
                secureText: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, right: Get.width * 0.085, left: Get.width * 0.085),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColorUtils.getColorFromHex(CustomColors.textField),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: ListTile(
                    title: Text(
                      'Upload your photo',
                      style: TextStyle(
                        color: HexColorUtils.getColorFromHex(
                            CustomColors.hintText),
                      ),
                    ),
                    trailing: Icon(Icons.upload_file),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, right: Get.width * 0.085, left: Get.width * 0.085),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColorUtils.getColorFromHex(CustomColors.textField),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: ListTile(
                    title: Text(
                      'Upload your Vehicle’s photo',
                      style: TextStyle(
                        color: HexColorUtils.getColorFromHex(
                            CustomColors.hintText),
                      ),
                    ),
                    trailing: Icon(Icons.upload_file),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  