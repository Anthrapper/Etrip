import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:etrip/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              // width: Get.width * 0.5,
              // height: Get.height * 0.23,
              width: Get.width * 0.35,
              height: Get.height * 0.16,
              image: AssetImage('assets/images/full_logo.png'),
            ),
            Text(
              'YOUR MOBILITY PARTNER',
              style: TextStyle(
                  letterSpacing: 3,
                  // fontSize: 18.0,
                  fontSize: 17,
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'BoringSans'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  