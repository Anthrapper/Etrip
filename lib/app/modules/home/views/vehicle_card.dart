import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleCard extends StatelessWidget {
  final String name;
  final String iconUrl;
  final String id;
  VehicleCard({this.name, this.iconUrl, this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: Get.height * 0.1,
        width: Get.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(1, 3),
            ),
          ],
        ),
        child: FlatButton(
          onPressed: () async {
            List arg = [this.id, this.name.capitalizeFirst];
            await Get.toNamed(
              AppPages.VEHICLEFORM,
              arguments: arg,
            );
          },
          child: Image.network(
            this.iconUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
