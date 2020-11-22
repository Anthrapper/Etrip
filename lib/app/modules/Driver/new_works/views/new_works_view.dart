import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Widgets/customButton2.dart';
import 'package:etrip/app/data/Widgets/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/Driver/new_works/controllers/new_works_controller.dart';

class NewWorksView extends GetView<NewWorksController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'New Works',
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return controller.isLoading.value ? Center(
            child: CircularProgressIndicator(),
          ):
          ListView.builder(
          shrinkWrap: true,
          itemCount: controller.newWork == null ? 0 : controller.newWork.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: CustomContainer(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: Get.width * 0.85,
                        child: ListTile(
                          title: Text(
                            controller.newWork[index]['from_place'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
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
                            controller.newWork[index]['to_place'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          trailing: Icon(Icons.location_on),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.18,
                      right: 20,
                      child: CustomButton2(
                        text: 'bids'.tr,
                        onpressed: () {},
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.23,
                      right: 20,
                      child: CustomButton2(
                        text: 'Set Bid Amount',
                        onpressed: () {},
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: Get.height * 0.24,
                      child: Text(
                        controller.newWork[index]['vehicle'][0],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        // '${this.amount}'
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: Get.height * 0.2,
                      child: Text(
                        controller.newWork[index]['date'],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );}
      ),
    );
  }
}
