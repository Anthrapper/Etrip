import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoWidget(),
            heading(),
            button(),
          ],
        ),
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.01, 0, 0),
      child: Text(
        'welcome'.tr,
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.15),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.11),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'whatdo'.tr,
                  style: TextStyle(
                    fontSize: Get.height * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.toNamed(AppPages.SIGNUP);
                },
                child: ListTile(
                  title: Text(
                    'ride'.tr,
                    style: TextStyle(
                        color: (CustomColors.headings),
                        fontSize: Get.height * 0.024),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              Divider(),
              FlatButton(
                onPressed: () {
                  Get.toNamed(AppPages.SIGNUP_DRIVER);
                },
                child: ListTile(
                  title: Text(
                    'drive'.tr,
                    style: TextStyle(
                        color: (CustomColors.headings),
                        fontSize: Get.height * 0.024),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
