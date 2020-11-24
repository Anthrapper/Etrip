import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:etrip/app/modules/User/bids/controllers/bids_controller.dart';

import 'package:get/get.dart';

class BidCards extends StatelessWidget {
  final String name;
  final String img;
  final String amount;
  final String bidId;
  final bool buttonRemove;
  BidCards({this.name, this.img, this.amount, this.bidId, this.buttonRemove});
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
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  // minWidth: 100,
                  // minHeight: 260,
                  maxWidth: Get.width * 0.45,
                  // maxHeight: 264,
                ),
                child: Image.network(
                  this.img,
                  fit: BoxFit.fill,
                ),
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
                      this.buttonRemove
                          ? SizedBox()
                          : CustomButton1(
                              text: 'Select Bid',
                              onpressed: () {
                                CustomNotifiers().areYouSure(() {
                                  Get.find<BidsController>()
                                      .selectBid(this.bidId);
                                });
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
