import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';
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
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Trip',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Trip History',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 0.5,
                  // color: HexColorUtils.getColorFromHex(CustomColors.buttonColor1),
                ),
                FlatButton(
                  onPressed: () async {
                    await AuthHelper().removeToken().whenComplete(
                        () async => await Get.offAllNamed(AppPages.LOGIN));
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
                          'Logout',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                        ),
                        Icon(Icons.exit_to_app),
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
