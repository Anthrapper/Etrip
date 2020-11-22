import 'package:etrip/app/modules/User/my_trip/controllers/my_trip_controller.dart';
import 'package:etrip/app/modules/User/my_trip/views/my_trip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';

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
          'mytrip'.tr,
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          Get.width * 0.04,
          Get.height * 0.02,
          Get.width * 0.04,
          Get.height * 0.02,
        ),
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.myTrips == null
                      ? 0
                      : controller.myTrips.length,
                  itemBuilder: (context, index) {
                    return MyTripCard(
                      // amount: '5500',
                      from: controller.myTrips[index]['from_place'],
                      to: controller.myTrips[index]['to_place'],
                      date: controller.myTrips[index]['date'],
                    );
                  },
                );
        }),
      ),
    );
  }
}
