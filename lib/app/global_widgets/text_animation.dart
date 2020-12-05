import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TypewriterText extends StatelessWidget {
  final String text;

  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<int>(
      duration: 800.milliseconds,
      delay: 800.milliseconds,
      tween: 0.tweenTo(text.length),
      builder: (context, child, textLength) {
        return Text(
          text.substring(0, textLength),
          style: CustomTextStyles().typeWriter,
        );
      },
    );
  }
}
