import 'package:etrip/app/data/Widgets/customwidgets.dart';
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
            child: CustomButton1(
              text: 'Bids',
              onpressed: () {},
            ),
          ),
          Positioned(
            top: Get.height * 0.23,
            right: 20,
            child: CustomButton1(
              text: 'Selected Bid',
              onpressed: () {},
            ),
          ),
          Positioned(
            top: Get.height * 0.28,
            right: 20,
            child: CustomButton1(
              text: 'Trip Completed',
              onpressed: () {},
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
            child: Text('Amount: ${this.amount}'),
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
