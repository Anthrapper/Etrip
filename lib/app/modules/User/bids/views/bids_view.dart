import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/modules/User/bids/views/bidcard.dart';
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
      body: Obx(() {
        return controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount:
                    controller.bidList == null ? 0 : controller.bidList.length,
                itemBuilder: (context, index) {
                  return BidCards(
                    amount: controller.bidList[index]['amount'],
                    img: controller.bidList[index]['vehicle'],
                    name: controller.bidList[index]['driver'],
                    bidId: controller.bidList[index]['id'].toString(),
                  );
                },
              );
      }),
    );
  }
}
