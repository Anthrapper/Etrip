import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/validator.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/Driver/VehicleDetails/controllers/vehicle_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
              Form(
                key: controller.vehicleDetailsKey,
                child: Obx(
                  () {
                    return controller.isLoading.value
                        ? Center(
                            child: SpinKitCubeGrid(color: CustomColors.buttonColor),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.vehicleData == null
                                ? 0
                                : controller.vehicleData.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (controller.vehicleData != null) {
                                return Column(
                                  children: [
                                    Obx(
                                      () => CustomImageField(
                                        hasData:
                                            controller.items[index].value !=
                                                    null
                                                ? true
                                                : false,
                                        text:
                                            '${controller.vehicleData[index]['name']}',
                                        onTap: () {
                                          CustomNotifiers().uploadSelection(
                                              controller.items[index]);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CustomTextField(
                                        suffixChecker: false,
                                        validator: FormValidator().reqValidator,
                                        controller:
                                            controller.textController[index],
                                        hintText:
                                            'Registration No of ${controller.vehicleData[index]['name']}',
                                        secureText: false,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          );
                  },
                ),
              ),
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
      padding: EdgeInsets.fromLTRB(
        Get.width * 0.1,
        Get.height * 0.01,
        0,
        0,
      ),
      child: Text(
        'Vehicle Details',
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
        text: 'Submit',
        onpressed: () async {
          List<String> argList = controller.items
              .asMap()
              .entries
              .map((e) => '${e.value}')
              .toList();
          if (argList.contains('null')) {
            CustomNotifiers()
                .snackBar('Error', 'Please Upload all photos', Icons.error);
          } else {
            if (controller.vehicleDetailsKey.currentState.validate()) {
              CustomNotifiers().progressIndicator();
              for (var i = 0; i <= controller.vehicleData.length - 1; i++) {
                await controller.uploadDocuments(
                  controller.items[i].value,
                  controller.vehicleData[i]['id'].toString(),
                  controller.textController[i].text,
                  i,
                );
              }
            }
          }
        },
      ),
    );
  }
}
