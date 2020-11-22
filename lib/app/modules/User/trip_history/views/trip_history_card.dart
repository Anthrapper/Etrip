import 'package:etrip/app/data/Widgets/customButton2.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripHistoryCard extends StatelessWidget {
  final String from;
  final String to;
  final String amount;
  final String date;
  TripHistoryCard({this.from, this.to, this.amount, this.date});
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
            top: Get.height * 0.18,
            right: 20,
            child: CustomButton2(
              text: 'bids'.tr,
              onpressed: () {},
            ),
          ),
          // TODO: TEXT OVERFLOW IN MALAYALAM
          Positioned(
            top: Get.height * 0.23,
            right: 20,
            child: CustomButton2(
              text: 'selbid'.tr,
              onpressed: () {},
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
    );
  }
}
