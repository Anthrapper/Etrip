import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/modules/Driver/driver_bids/controllers/driver_bids_controller.dart';
import 'package:etrip/app/modules/Driver/driver_bids/views/driver_bids_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DriverBidsView extends GetView<DriverBidsController> {
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
      body: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: SpinKitCubeGrid(color: CustomColors.buttonColor),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.bidList == null
                      ? 0
                      : controller.bidList.length,
                  itemBuilder: (context, index) {
                    return DriverBidCards(
                      amount: controller.bidList[index]['amount'],
                      img: controller.bidList[index]['vehicle'],
                      name: controller.bidList[index]['driver'],
                      bidId: controller.bidList[index]['id'].toString(),
                    );
                  },
                );
        },
      ),
    );
  }
}
