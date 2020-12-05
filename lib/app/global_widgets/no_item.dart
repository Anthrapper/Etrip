import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NoItemHere extends StatelessWidget {
  final String reason;
  NoItemHere({this.reason = 'No trips yet'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundGradient(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: Get.width * 0.1,
                  top: Get.height * 0.25,
                ),
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.3,
                  child: FadeIn(
                    delay: 0.001,
                    child: SvgPicture.string(
                      SvgAssets.noTrips,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.06),
                child: TypewriterText(reason),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
