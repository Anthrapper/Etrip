import 'package:etrip/app/data/Widgets/customform.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/signup_driver/controllers/signup_driver_controller.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';

class SignupDriverView extends GetView<SignupDriverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
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
              FlatButton(
                onPressed: () {
                  Get.toNamed(AppPages.DRIVER_DETAILS);
                },
                child: Text('DriverDetails'),
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
      child: CustomButton(
          text: 'Submit',
          onpressed: () {
            CustomNotifiers().progressIndicator();
            controller.doSignUp();
          }),
    );
  }

  Widget form() {
    return Padding(
      padding:
          EdgeInsets.only(top: Get.height * 0.1, bottom: Get.height * 0.03),
      child: Form(
        key: controller.formKey1,
        child: Column(
          children: [
            CustomTextField(
              suffixChecker: true,
              controller: controller.name,
              hintText: 'Name',
              secureText: false,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: true,
                controller: controller.email,
                hintText: 'Email',
                secureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: true,
                controller: controller.number,
                hintText: 'Phone Number',
                secureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Obx(
                () => CustomTextField(
                  obsecure: controller.obscure,
                  icon: Icons.visibility,
                  suffixChecker: true,
                  controller: controller.password,
                  hintText: 'Enter Password',
                  secureText: controller.showText.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Obx(
                () => CustomTextField(
                  obsecure: controller.obscure,
                  icon: Icons.visibility,
                  suffixChecker: true,
                  controller: controller.confPass,
                  hintText: 'Confirm Password',
                  secureText: controller.showText.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
