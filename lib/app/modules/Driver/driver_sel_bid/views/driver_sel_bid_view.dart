import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/Driver/driver_sel_bid/controllers/driver_sel_bid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DriverSelBidView extends GetView<DriverSelBidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Selected Bid',
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: SpinKitCubeGrid(color: CustomColors.buttonColor),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.01,
                    left: Get.width * 0.03,
                    right: Get.width * 0.03,
                  ),
                  child: controller.nullChecker.value == false
                      ? nothingHere()
                      : Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: Get.height * 0.02,
                                  bottom: Get.height * 0.02),
                              height: Get.height * 0.17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      radius: Get.height * 0.05,
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.04),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.bidData[0]['name'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: CustomColors.textColorOne,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Bid Amount: ',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      '₹ ${controller.bidData[0]['amount'].toString()}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: CustomButton1(
                                              text: 'Call',
                                              onpressed: () {
                                                UrlLauncher.launch(
                                                    'tel: ${controller.bidData[0]['phone']}');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                );
        },
      ),
    );
  }

  Widget nothingHere() {
    return Center(
      child: Text(
        'No Bid Selected',
        style: CustomTextStyles().medium,
      ),
    );
  }
}
