import 'package:flutter/material.dart';

class HexColorUtils {
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (int.tryParse(hexColor, radix: 16) != null) {
      return Color(int.tryParse(hexColor, radix: 16));
    }
    return Colors.black;
  }
}
