import 'package:etrip/app/modules/Driver/signup_driver/controllers/signup_driver_controller.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:etrip/app/data/Functions/validator.dart';

import 'package:get/get.dart';
import 'package:etrip/app/data/Constants/constants.dart';
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
              LogoWidget(),
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

  Widget heading() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.01, 0, 0),
      child: Text(
        'signup'.tr,
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
          text: 'submit'.tr,
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
              suffixChecker: false,
              validator: FormValidator().reqValidator,
              controller: controller.name,
              hintText: 'name'.tr,
              secureText: false,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: false,
                validator: FormValidator().emailValidator,
                controller: controller.email,
                hintText: 'email'.tr,
                secureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: false,
                validator: FormValidator().mobileValidator,
                controller: controller.number,
                hintText: 'number'.tr,
                secureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Obx(
                () => CustomTextField(
                  suffixChecker: true,
                  validator: FormValidator().passwordValidator,
                  obsecure: controller.obscure,
                  icon: Icons.visibility,
                  controller: controller.password,
                  hintText: 'password'.tr,
                  secureText: controller.showText.value,
                ),
              ),
            ),
            Padding(
              // TODO: Error string
              padding: const EdgeInsets.only(top: 20.0),
              child: Obx(
                () => CustomTextField(
                  suffixChecker: true,
                  validator: FormValidator().confirmPassword(
                      controller.confPass.text, controller.password.text),
                  obsecure: controller.obscure,
                  icon: Icons.visibility,
                  controller: controller.confPass,
                  hintText: 'confirmpassword'.tr,
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
