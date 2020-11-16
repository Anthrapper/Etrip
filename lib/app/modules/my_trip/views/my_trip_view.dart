import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:etrip/app/modules/my_trip/controllers/my_trip_controller.dart';
import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';

class MyTripView extends GetView<MyTripController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Trip History',
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(Get.width * 0.04, Get.height * 0.02, Get.width * 0.04, Get.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [

              // MyTrip
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: EdgeInsets.fromLTRB(Get.width * 0.03, Get.height * 0.01,
                      Get.width * 0.03, Get.height * 0.02),
                  width: Get.width,
                  height: Get.height * 0.353,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: Get.width * 0.85,
                          child: ListTile(
                            title: Text(
                              'Kannur',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            // leading: Icon(Icons.gps_fixed),
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
                              'Alappuzha',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            // leading: Icon(Icons.location_on),
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
                        child: Text('Amount: ₹ 5500'),
                      ),
                      Positioned(
                        left: 20,
                        top: Get.height * 0.2,
                        child: Text('Nov 4, 2020'),
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
  