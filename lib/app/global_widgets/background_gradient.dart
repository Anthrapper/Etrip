import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class BackgroundGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(Get.width, 0),
        [
          Color(0xff052450),
          Color(0xff479590),
        ],
      );

    var path = Path();
    path.lineTo(0, Get.height * 0.55);
    path.cubicTo(0, Get.height * 0.6, Get.width, Get.height * 0.3, Get.width,
        Get.height * 0.2);
    path.lineTo(Get.width, 0);
    canvas.drawShadow(path, Colors.grey, 1.0, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
