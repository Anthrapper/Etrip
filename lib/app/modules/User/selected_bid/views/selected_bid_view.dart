import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Widgets/customButton1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/User/selected_bid/controllers/selected_bid_controller.dart';

class SelectedBidView extends GetView<SelectedBidController> {
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
      body: Padding(
        padding: EdgeInsets.only(
            top: Get.height * 0.01, left: Get.width * 0.03, right: Get.width * 0.03),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Get.height * 0.02, bottom: Get.height * 0.02),
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
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Eric Widget',
                            style: TextStyle(
                              fontSize: 18,
                              color: CustomColors.textColorOne,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Bid Amount: ',
                                style: TextStyle(fontSize: 18, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '₹ 4000',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomButton1(
                              text: 'Call',
                              onpressed: () {},
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
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Vehicle Image',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
