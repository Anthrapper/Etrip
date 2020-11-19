import 'package:etrip/app/data/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: (CustomColors.headings),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: Get.height * 0.01),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.grey,
                      spreadRadius: 1,
                      offset: Offset(2, 3),
                    )
                  ]
                ),
                child: ListTile(
                  onTap: (){},
                  title: Text('New Trip Posted'),
                  subtitle: Text('A new trip has been posted.'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
