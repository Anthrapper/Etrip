import 'package:etrip/app/data/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCard extends StatelessWidget {
  final String msg;
  final String date;
  final String title;

  NotificationCard({this.msg, this.date, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Colors.grey,
                spreadRadius: 1,
                offset: Offset(2, 3),
              )
            ]),
        child: Container(
          // padding: EdgeInsets.all(10),
          height: Get.height * 0.17,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    color: CustomColors.buttonColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  this.title,
                  style: TextStyle(
                    color: Color(0xffC4C4C4),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 10,
                right: 10,
                child: Text(this.msg),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  this.date,
                  style: TextStyle(
                    fontSize: 12,
                    color: CustomColors.hintText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
