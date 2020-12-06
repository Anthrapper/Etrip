import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class LogoAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      delay: 0.microseconds,
      tween: 0.0.tweenTo(200.0),
      duration: 1.3.seconds,
      curve: Curves.easeOut,
      builder: (context, child, value) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.35,
            maxHeight: Get.height * 0.16,
          ),
          child: Image(
            width: value,
            height: value,
            image: AssetImage('assets/images/full_logo.png'),
          ),
        );
      },
    );
  }
}
