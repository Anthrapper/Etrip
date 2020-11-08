import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:etrip/app/data/Widgets/customform.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
              language(),
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
        'Login',
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
        text: 'LOGIN',
        onpressed: controller.dologin,
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
              controller: controller.email,
              hintText: 'Enter Email or phone number',
              secureText: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Obx(
                () => CustomTextField(
                  obsecure: controller.obscure,
                  icon: Icons.visibility,
                  suffixChecker: true,
                  controller: controller.password,
                  hintText: 'Password',
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
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.1, vertical: Get.height * 0.1),
      child: Row(
        children: [
          Text(
            'Choose a language',
            style: CustomTextStyles().smallText,
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(left: Get.width * 0.08),
              child: InkWell(
                onTap: controller.enSelected,
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
                padding: EdgeInsets.only(left: Get.width * 0.08),
                child: InkWell(
                  onTap: controller.mlSelected,
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
}
