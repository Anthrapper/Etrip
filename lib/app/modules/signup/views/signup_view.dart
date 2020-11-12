import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:etrip/app/data/Widgets/customform.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/signup/controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
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
              button(),
              FlatButton(
                onPressed: () {
                  Get.offAllNamed(AppPages.INITIAL);
                },
                child: Text('To Home'),
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
        text: 'SIGNUP',
        onpressed: controller.doSignUp,
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
      child: Form(
        key: controller.formKey,
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
                hintText: 'Enter email or phone number',
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
                  hintText: 'New Password',
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
