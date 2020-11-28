import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/validator.dart';
import 'package:etrip/app/data/Widgets/customform.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
              language(),
              toSignUp(),
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
        'login'.tr,
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
        text: 'login'.tr,
        onpressed: () {
          if (controller.loginKey.currentState.validate()) {
            CustomNotifiers().progressIndicator();
            controller.login();
          }
        },
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
      child: Form(
        key: controller.loginKey,
        child: Column(
          children: [
            CustomTextField(
              suffixChecker: false,
              validator: FormValidator().reqValidator,
              controller: controller.userName,
              hintText: 'emailornumber'.tr,
              secureText: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Obx(
                () => CustomTextField(
                  suffixChecker: true,
                  validator: FormValidator().reqValidator,
                  obsecure: controller.obscure,
                  icon: controller.iconController.value,
                  controller: controller.password,
                  hintText: 'password'.tr,
                  secureText: controller.showText.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget language() {
    return Padding(
      padding: EdgeInsets.only(
        right: Get.width * 0.1,
        left: Get.width * 0.1,
        top: Get.height * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'chooselanguage'.tr,
            style: CustomTextStyles().smallText,
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(left: Get.width * 0.03),
              child: TextButton(
                onPressed: controller.enSelected,
                child: Text(
                  'English',
                  style: controller.en.value
                      ? CustomTextStyles().smallButtonText
                      : CustomTextStyles().smallText,
                ),
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.03),
                child: TextButton(
                  onPressed: controller.mlSelected,
                  child: Text(
                    'Malayalam',
                    style: controller.ml.value
                        ? CustomTextStyles().smallButtonText
                        : CustomTextStyles().smallText,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget toSignUp() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.11, 0, 10, 0),
      child: Row(
        children: [
          Text(
            'noaccount'.tr,
            style: CustomTextStyles().smallText,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.03),
            child: TextButton(
              onPressed: () => Get.offAllNamed(AppPages.SIGNUP_SELECTION),
              child: Text(
                'dosignup'.tr,
                style: CustomTextStyles().smallButtonText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
