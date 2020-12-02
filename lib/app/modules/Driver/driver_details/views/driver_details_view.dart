import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:etrip/app/data/Functions/storage_helper.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/data/Widgets/logo.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:etrip/app/modules/Driver/driver_details/controllers/driver_details_controller.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DriverDetailsView extends GetView<DriverDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () async {
                    await StorageHelper().removeToken().whenComplete(
                          () async => await Get.offAllNamed(AppPages.LOGIN),
                        );
                  },
                  child: Text(
                    'Log Out',
                    style: CustomTextStyles().drawer,
                  ),
                ),
              ),
              LogoWidget(),
              heading(),
              form(),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.height * 0.03,
                  bottom: Get.height * 0.05,
                ),
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
        'Driver Details',
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
        text: 'Submit',
        onpressed: () {
          if (controller.myActivities.isNotEmpty &&
              controller.licenseBack.value != '' &&
              controller.photo.value != '' &&
              controller.licenseFront.value != '') {
            print(controller.photo.value);
            print(controller.licenseBack.value);
            print(controller.licenseFront.value);
            CustomNotifiers().progressIndicator();
            controller.photoUpload();
          }
        },
      ),
    );
  }

  Widget form() {
    return Padding(
      padding:
          EdgeInsets.only(top: Get.height * 0.02, bottom: Get.height * 0.03),
      child: Column(
        children: [
          Obx(
            () => CustomImageField(
              hasData: controller.photo.value != '' ? true : false,
              text: 'Upload your photo',
              onTap: () {
                CustomNotifiers().uploadSelection(controller.photo);
              },
            ),
          ),
          Obx(
            () => CustomImageField(
              hasData: controller.licenseFront.value != '' ? true : false,
              text: 'Upload your license - front',
              onTap: () {
                CustomNotifiers().uploadSelection(controller.licenseFront);
              },
            ),
          ),
          Obx(
            () => CustomImageField(
              text: 'Upload your license - back',
              hasData: controller.licenseBack.value != '' ? true : false,
              onTap: () {
                CustomNotifiers().uploadSelection(controller.licenseBack);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 20.0, right: Get.width * 0.085, left: Get.width * 0.085),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () {
                  return controller.showWidget.value == false
                      ? Center(
                          child: SpinKitCubeGrid(color: CustomColors.buttonColor),
                        )
                      : MultiSelectFormField(
                          autovalidate: false,
                          fillColor: CustomColors.textField,
                          chipBackGroundColor: (CustomColors.buttonColor1),
                          chipLabelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          dialogTextStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          checkBoxActiveColor: Colors.green,
                          checkBoxCheckColor: Colors.white,
                          dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          title: Text(
                            "Vehicles",
                            style: TextStyle(
                              color: CustomColors.hintText,
                              fontSize: 16,
                            ),
                          ),
                          dataSource: controller.vehicleData,
                          textField: 'name',
                          valueField: 'id',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          hintWidget: Text(
                            'Please select your vehicles',
                            style: TextStyle(
                              color: CustomColors.hintText,
                              fontSize: 13,
                            ),
                          ),
                          initialValue: controller.myActivities,
                          onSaved: (value) {
                            if (value == null) return;

                            controller.myActivities = value;
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
