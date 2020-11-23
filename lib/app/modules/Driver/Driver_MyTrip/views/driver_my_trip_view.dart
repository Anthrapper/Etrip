import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/modules/Driver/Driver_MyTrip/controllers/driver_my_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/Driver/Driver_MyTrip/views/driver_mytrip_cards.dart';
import 'package:intl/intl.dart';

class DriverMyTripView extends GetView<DriverMyTripController> {
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
                    String formattedDate = DateFormat('dd-MM-yyyy hh:mm')
                        .format(
                            DateTime.parse(controller.myTrips[index]['date']));

                    return DriverMyTripCard(
                      status: controller.myTrips[index]['trip_status'],
                      amount: controller.myTrips[index]['amount'].toString(),
                      id: controller.myTrips[index]['trip'].toString(),
                      from: controller.myTrips[index]['from_place'],
                      to: controller.myTrips[index]['to_place'],
                      date: formattedDate,
                    );
                  },
                );
        }),
      ),
    );
  }
}
