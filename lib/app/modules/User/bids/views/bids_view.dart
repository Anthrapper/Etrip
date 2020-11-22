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
                              onpressed: () {
                                Get.dialog(
                                  Center(
                                    child: Container(
                                      height: Get.height * 0.33,
                                      width: Get.width * 0.8,
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
                                      child: Scaffold(
                                        body: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Center(
                                                  child: Text(
                                                    'Are you sure you want to select this bid?',
                                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                              child: Text(
                                                'Once selected it cannot be changed!',
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                //TODO : Add functions for yes and no buttons
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: Get.width * 0.35,
                                                    height: Get.height * 0.05,
                                                    child: FlatButton(
                                                      shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(10.0)),
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
                                                            borderRadius: new BorderRadius.circular(10.0)),
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
