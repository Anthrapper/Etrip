import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  CustomContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          Get.width * 0.03,
          Get.height * 0.01,
          Get.width * 0.03,
          Get.height * 0.02,
        ),
        width: Get.width,
        height: Get.height * 0.353,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: this.child,
      ),
    );
  }
}
