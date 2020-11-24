import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DriverBidCards extends StatelessWidget {
  final String name;
  final String img;
  final String amount;
  final String bidId;
  DriverBidCards({
    this.name,
    this.img,
    this.amount,
    this.bidId,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.01, horizontal: Get.width * 0.03),
      child: Container(
        padding:
            EdgeInsets.only(top: Get.height * 0.02, bottom: Get.height * 0.02),
        height: Get.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey,
                spreadRadius: 1,
                offset: Offset(2, 4),
              ),
            ]),
        child: Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                // minWidth: 100,
                // minHeight: 260,
                maxWidth: Get.width * 0.45,
                // maxHeight: 264,
              ),
              child: Image.network(this.img, fit: BoxFit.fitHeight),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(
                        fontSize: Get.width * 0.056,
                        color: CustomColors.textColorOne,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Bid Amount: ',
                        style: TextStyle(
                            fontSize: Get.width * 0.035, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '₹ ${this.amount}',
                            style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
