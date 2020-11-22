import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Widgets/customButton2.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripCard extends StatelessWidget {
  final String from;
  final String to;
  final String date;
  final String amount;
  MyTripCard({this.from, this.to, this.date, this.amount});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: Get.width * 0.85,
              child: ListTile(
                title: Text(
                  this.from,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.gps_fixed),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              width: Get.width * 0.85,
              child: ListTile(
                title: Text(
                  this.to,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.location_on),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.18,
            right: 20,
            child: CustomButton2(
              text: 'bids'.tr,
              onpressed: () {
                Get.toNamed(AppPages.BIDS);
              },
            ),
          ),
          Positioned(
            top: Get.height * 0.23,
            right: 20,
            child: CustomButton2(
              text: 'selbid'.tr,
              onpressed: () {
                Get.toNamed(AppPages.SELECTED_BID);
              },
            ),
          ),
          Positioned(
            top: Get.height * 0.28,
            right: 20,
            child: CustomButton1(
              text: 'tripcomp'.tr,
              onpressed: () {
                Get.dialog(
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      height: Get.height * 0.33,
                      width: Get.width * 0.8,
                      child: Scaffold(
                        body: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(
                                    'Are you sure that the trip is completed?',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 20),
                              child: Row(
                                //TODO : Add functions for yes and no buttons
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Get.width * 0.35,
                                    height: Get.height * 0.05,
                                    child: FlatButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      color: CustomColors.buttonColor1,
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      width: Get.width * 0.35,
                                      height: Get.height * 0.05,
                                      child: FlatButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0)),
                                        color: Color(0xffB82424),
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            // bottom: Get.height * 0.5,
            child: Center(
              child: Divider(
                thickness: 3,
              ),
            ),
          ),
          // Positioned(
          //   left: 20,
          //   top: Get.height * 0.24,
          //   child: Text('amount'.tr + ': ${this.amount}'),
          // ),
          Positioned(
            left: 20,
            top: Get.height * 0.2,
            child: Text(this.date),
          ),
        ],
      ),
    );
  }
}
