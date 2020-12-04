import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/validator.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/User/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
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
              button(),
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
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.1),
      child: Center(
        child: CustomButton(
          text: 'signup'.tr,
          onpressed: () {
            FocusScope.of(Get.context).unfocus();

            if (controller.regKey.currentState.validate()) {
              CustomNotifiers().progressIndicator();
              controller.doSignUp();
            }
          },
        ),
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
      child: Form(
        key: controller.regKey,
        child: Column(
          children: [
            CustomTextField(
              suffixChecker: false,
              controller: controller.name,
              hintText: 'name'.tr,
              secureText: false,
              validator: FormValidator().reqValidator,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: false,
                validator: FormValidator().reqValidator,
                controller: controller.username,
                hintText: 'emailornumber'.tr,
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
                  icon: controller.iconController.value,
                  controller: controller.password,
                  hintText: 'newpassword'.tr,
                  secureText: controller.showText.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Obx(
                () => CustomTextField(
                  suffixChecker: true,
                  validator: (val) =>
                      MatchValidator(errorText: 'Passwords do not match')
                          .validateMatch(val, controller.password.text),
                  obsecure: controller.obscure,
                  icon: controller.iconController.value,
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
