import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/modules/User/trip_history/controllers/trip_history_controller.dart';
import 'package:etrip/app/modules/User/trip_history/views/trip_history_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripHistoryView extends GetView<TripHistoryController> {
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
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return TripHistoryCard(
                amount: '5500',
                date: 'Nov 20, 1994',
                from: 'Cochi',
                to: 'Kanjikkuzhi',
              );
            }),
      ),
    );
  }
}
