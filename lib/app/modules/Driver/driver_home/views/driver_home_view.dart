import 'package:carousel_slider/carousel_slider.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Widgets/customButton.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/modules/Driver/driver_home/controllers/driver_home_controller.dart';
import 'package:etrip/app/modules/Driver/driver_home/views/driver_drawer.dart';
import 'package:etrip/app/modules/Driver/new_works/controllers/new_works_controller.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverHomeView extends GetView<DriverHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DriverDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          'eTRIP',
          style: TextStyle(
            color: Color(0xff121214),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Get.toNamed(AppPages.NOTIFICATION);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                child: Container(
                  height: Get.height * 0.2,
                  child: Obx(
                    () {
                      return controller.imgLoading.value
                          ? imgPlaceholder()
                          : CarouselSlider.builder(
                              itemCount: controller.adImg == null
                                  ? 0
                                  : controller.adImg.length,
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                              ),
                              itemBuilder: (context, index) {
                                // print(controller.adImg.length);
                                // print(controller.adImg[index]['ad_banner']);
                                return Container(
                                  child: Center(
                                    child: Image.network(
                                      controller.adImg[index]['ad_banner'],
                                      fit: BoxFit.cover,
                                      width: Get.width,
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 9),
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(1, 3),
                              )
                            ]),
                        child: FlatButton(
                          onPressed: () async {
                            await Get.toNamed(AppPages.DRIVER_MY_TRIP);
                          },
                          child: ListTile(
                            title: Text(
                              'mytrip'.tr,
                              style: CustomTextStyles().mlHome,
                            ),
                            subtitle: Text('seetrip'.tr),
                            trailing: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    offset: Offset(2, 4),
                                  )
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: CustomColors.buttonColor,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 9),
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(1, 3),
                              )
                            ]),
                        child: FlatButton(
                          onPressed: () {
                            Get.toNamed(AppPages.TRIP_HISTORY);
                          },
                          child: ListTile(
                            title: Text(
                              'triphistory'.tr,
                              style: CustomTextStyles().mlHome,
                            ),
                            subtitle: Text('seetriphistory'.tr),
                            trailing: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    offset: Offset(2, 4),
                                  )
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: CustomColors.buttonColor,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.09,
                  vertical: Get.height * 0.03,
                ),
                child: Container(
                  child: CustomButton(
                    onpressed: () {
                      CustomNotifiers().progressIndicator();
                      controller.updateLoc();
                    },
                    text: 'Start New Bid',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imgPlaceholder() {
    return Container(
      height: 100,
      child: Image.asset('assets/images/etrip.jpg'),
    );
  }
}
