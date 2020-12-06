import 'package:etrip/app/global_widgets/global_widgets.dart';
import 'package:etrip/app/global_widgets/logo_animation.dart';
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
            LogoAnimation(),
            SizedBox(
              height: Get.height * 0.03,
            ),
            TypewriterText(
              delay: 0,
              text: 'YOUR MOBILITY PARTNER',
              textStyle: TextStyle(
                letterSpacing: 3,
                fontSize: 17,
                color: Colors.black,
                fontFamily: 'BoringSans',
              ),
            )
            // Text(
            //   'YOUR MOBILITY PARTNER',
            //   style: TextStyle(
            //     letterSpacing: 3,
            //     fontSize: 17,
            //     color: Colors.black,
            //     fontFamily: 'BoringSans',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
