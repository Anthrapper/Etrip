import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Widgets/customButton1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/User/selected_bid/controllers/selected_bid_controller.dart';
import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SelectedBidView extends GetView<SelectedBidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'selbid'.tr,
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
                  child: CircularProgressIndicator(),
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
                                bottom: Get.height * 0.02,
                              ),
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
                                      radius: Get.height * 0.07,
                                      backgroundImage: NetworkImage(
                                        controller.bidData[0]['photo'],
                                        scale: 1,
                                      ),
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
                                              text: 'bidamount'.tr,
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
                                              text: 'call'.tr,
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
                            Container(
                              height: Get.height * 0.3,
                              width: Get.width * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                controller.bidData[0]['vehicle'],
                                fit: BoxFit.fill,
                              ),
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
