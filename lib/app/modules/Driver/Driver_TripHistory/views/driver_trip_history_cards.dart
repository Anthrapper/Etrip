import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/global_widgets/fade_animation.dart';

class DriverTripHistoryCard extends StatelessWidget {
  final String from;
  final String id;
  final String to;
  final String amount;
  final String date;
  DriverTripHistoryCard({this.from, this.to, this.amount, this.date, this.id});
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: CustomContainer(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: Get.width * 0.85,
                child: ListTile(
                  title: Text(
                    this.to,
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
                    this.from,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(Icons.location_on),
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.21,
              right: 20,
              child: CustomButton2(
                text: 'bids'.tr,
                onpressed: () {
                  Get.toNamed(AppPages.DRIVER_BIDS, arguments: this.id);
                },
              ),
            ),
            Positioned(
              child: Center(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: Get.height * 0.24,
              child: Text('amount'.tr + ': ₹ ${this.amount}'),
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
