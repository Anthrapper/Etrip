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
  DriverMyTripCard({this.from, this.to, this.date, this.amount, this.id});
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
                print('tap');
                print(this.id);
                Get.toNamed(AppPages.BIDS, arguments: this.id);
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
                CustomNotifiers().tripCompletedDialog(() {});
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
    );
  }
}
