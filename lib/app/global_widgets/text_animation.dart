import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TypewriterText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int delay;

  TypewriterText(
      {@required this.text,
      this.delay = 0,
      this.textStyle = CustomTextStyles.typeWriter});

  @override
  Widget build(BuildContext context) {
    var orgDelay = delay + 1000;
    return PlayAnimation<int>(
      duration: 1100.milliseconds,
      delay: orgDelay.milliseconds,
      tween: 0.tweenTo(text.length),
      builder: (context, child, textLength) {
        return Text(
          text.substring(0, textLength),
          style: textStyle,
        );
      },
    );
  }
}
