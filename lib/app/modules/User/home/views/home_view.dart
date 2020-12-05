import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/global_widgets/background_gradient.dart';
import 'package:etrip/app/modules/User/home/controllers/home_controller.dart';
import 'package:etrip/app/modules/User/home/views/vehicle_card.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: new IconThemeData(
          color: Color(0xfff4f4f4),
        ),
        title: Text(
          'eTRIP',
          style: CustomTextStyles().appBar,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                Color(0xff052450),
                Color(0xff479590),
              ])),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color(0xfff4f4f4),
            ),
            onPressed: () {
              Get.toNamed(AppPages.NOTIFICATION);
            },
          )
        ],
      ),
      body: SafeArea(
          child: CustomPaint(
        painter: BackgroundGradient(),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.05,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[600],
                                blurRadius: 4,
                                offset: Offset(0, 1),
                              )
                            ]),
                        child: FlatButton(
                          onPressed: () async {
                            await Get.toNamed(AppPages.MY_TRIP);
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
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
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
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'startnewtrip'.tr,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Obx(
                        () {
                          return controller.isLoading.value
                              ? Container(
                                  padding:
                                      EdgeInsets.only(top: Get.height * 0.07),
                                  alignment: Alignment.center,
                                  child: SpinKitCubeGrid(
                                      color: CustomColors.buttonColor),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.vehicleData == null
                                      ? 0
                                      : controller.vehicleData.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return VehicleCard(
                                      id: controller.vehicleData[index]['id']
                                          .toString(),
                                      iconUrl: controller.vehicleData[index]
                                          ['icon'],
                                      name: controller.vehicleData[index]
                                          ['name'],
                                    );
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget imgPlaceholder() {
    return Container(
      height: 100,
      child: Image.asset('assets/images/etrip.jpg'),
    );
  }
}
