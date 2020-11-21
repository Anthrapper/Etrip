import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/validator.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/Driver/VehicleDetails/controllers/vehicle_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleDetailsView extends GetView<VehicleDetailsController> {
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                    Get.width * 0.1, Get.height * 0.01, 0, 0),
                child: Text(
                  'Upload The Photos',
                  style: CustomTextStyles().medium,
                ),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.vehicleData == null
                            ? 0
                            : controller.vehicleData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              CustomImageField(
                                text:
                                    '${controller.vehicleData[index]['name']}',
                              ),
                              // CustomTextField(
                              //   suffixChecker: false,
                              //   validator: FormValidator().reqValidator,
                              //   controller: controller.userName,
                              //   hintText:'Registration No of${controller.vehicleData[index]['name']}',
                              //   secureText: false,
                              // ),
                            ],
                          );
                        },
                      );
              }),
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
          // controller.photoUpload();
        },
      ),
    );
  }
}
