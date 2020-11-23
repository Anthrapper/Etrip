import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/modules/Driver/Driver_TripHistory/controllers/driver_trip_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/Driver/Driver_TripHistory/views/driver_trip_history_cards.dart';

class DriverTripHistoryView extends GetView<DriverTripHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'triphistory'.tr,
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(Get.width * 0.04, Get.height * 0.02,
            Get.width * 0.04, Get.height * 0.02),
        child: Obx(
          () {
            return controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.tripHistory == null
                        ? 0
                        : controller.tripHistory.length,
                    itemBuilder: (context, index) {
                      return DriverTripHistoryCard(
                        id: controller.tripHistory[index]['id'].toString(),
                        amount: controller.tripHistory[index]['amount'],
                        date: controller.tripHistory[index]['date'],
                        from: controller.tripHistory[index]['from_place'],
                        to: controller.tripHistory[index]['to_place'],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
