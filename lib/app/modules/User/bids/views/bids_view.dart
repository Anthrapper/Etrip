import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Widgets/customButton1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/User/bids/controllers/bids_controller.dart';

class BidsView extends GetView<BidsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Bids',
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.01, horizontal: Get.width * 0.03),
            child: Container(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.02),
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
                      child: Image.asset('assets/images/car.jpg',
                          fit: BoxFit.fitHeight),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.04),
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
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
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
                            CustomButton1(
                              text: 'Select Bid',
                              onpressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
