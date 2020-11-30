import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/storage_helper.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/modules/User/home/controllers/home_controller.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.height,
      width: Get.width * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              color: CustomColors.buttonColor,
              height: Get.height * 0.26,
              child: Padding(
                padding: EdgeInsets.all(Get.height * 0.025),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: Get.height * 0.04,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Obx(
                      () {
                        return Get.find<HomeController>().profileLoad.value
                            ? SizedBox()
                            : Padding(
                                padding:
                                    EdgeInsets.only(left: Get.width * 0.014),
                                child: Text(
                                  Get.find<HomeController>().profileData[0]
                                      ['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.MY_TRIP);
                    },
                    child: Text(
                      'mytrip'.tr,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.TRIP_HISTORY);
                    },
                    child: Text(
                      'triphistory'.tr,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (Get.locale.toString() == 'en') {
                        await Get.find<EtripServices>()
                            .box
                            .write('language', 'ml')
                            .whenComplete(
                              () => Get.updateLocale(
                                Locale('ml'),
                              ),
                            );
                      } else {
                        await Get.find<EtripServices>()
                            .box
                            .write('language', 'en')
                            .whenComplete(
                              () => Get.updateLocale(
                                Locale('en'),
                              ),
                            );
                      }
                    },
                    child: Text(
                      'changelang'.tr,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 0.5,
                ),
                FlatButton(
                  onPressed: () async {
                    await StorageHelper().removeToken().whenComplete(() async {
                      await Get.find<EtripServices>().box.erase();
                      await Get.offAllNamed(AppPages.LOGIN);
                      Get.reset(clearFactory: true, clearRouteBindings: true);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      Get.width * 0.01,
                      Get.height * 0.01,
                      0,
                      Get.width * 0.04,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'logout'.tr,
                          style: CustomTextStyles().drawer,
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                        ),
                        Expanded(child: Icon(Icons.exit_to_app)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
