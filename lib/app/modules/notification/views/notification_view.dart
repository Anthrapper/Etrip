import 'package:etrip/app/data/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/notification/controllers/notification_controller.dart';
import 'notification_cards.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          'notification'.tr,
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: Get.height * 0.01),
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: SpinKitCubeGrid(color: CustomColors.buttonColor),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: controller.notificationList == null
                      ? 0
                      : controller.notificationList.length,
                  itemBuilder: (context, index) {
                    return NotificationCard(
                      msg: controller.notificationList[index]['message'],
                      title: controller.notificationList[index]['title'],
                      date: controller.notificationList[index]['date'],
                    );
                  },
                );
        }),
      ),
    );
  }
}
