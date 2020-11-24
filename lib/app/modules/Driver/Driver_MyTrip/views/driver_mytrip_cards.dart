import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverMyTripCard extends StatelessWidget {
  final String from;
  final String to;
  final String date;
  final String amount;
  final String id;
  final String status;
  DriverMyTripCard(
      {this.from, this.to, this.date, this.amount, this.id, this.status});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Get.width * 0.04,
        Get.height * 0.008,
        Get.width * 0.04,
        Get.height * 0.008,
      ),
      child: CustomContainer(
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
                  Get.toNamed(
                    AppPages.DRIVER_BIDS,
                    arguments: this.id,
                  );
                },
              ),
            ),
            // Positioned(
            //   top: Get.height * 0.23,
            //   right: 20,
            //   child: CustomButton2(
            //     text: 'selbid'.tr,
            //     onpressed: () {
            //       Get.toNamed(AppPages.SELECTED_BID);
            //     },
            //   ),
            // ),
            // this.status == 'Approved'
            //     ? Positioned(
            //         top: Get.height * 0.28,
            //         right: 20,
            //         child: CustomButton1(
            //           text: 'tripcomp'.tr,
            //           onpressed: () {
            //             CustomNotifiers().tripCompletedDialog(() {});
            //           },
            //         ),
            //       )
            //     : SizedBox(),
            Positioned(
              // bottom: Get.height * 0.5,
              child: Center(
                child: Divider(
                  thickness: 3,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: Get.height * 0.24,
              child: Text('amount'.tr + ': ${this.amount}'),
            ),
            Positioned(
              left: 20,
              top: Get.height * 0.2,
              child: Text(this.date),
            ),
          ],
        ),
      ),
    );
  }
}
