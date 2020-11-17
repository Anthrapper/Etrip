import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.08, 0, 0),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/logo.png'),
        backgroundColor: Colors.transparent,
        radius: Get.height * 0.055,
      ),
    );
  }
}
