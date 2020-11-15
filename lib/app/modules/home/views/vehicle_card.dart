import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleCard extends StatelessWidget {
  final String name;
  final String iconUrl;
  VehicleCard({this.name, this.iconUrl});
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
            var vName = 'Otorsha';
            await Get.toNamed(AppPages.VEHICLEFORM, arguments: vName);
          },
          child: Image.network(
            'https://etripml.s3.amazonaws.com/media/assets/icons/ricksaw20201114135454.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASATQSK4MMRBTTO7M%2F20201114%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20201114T135501Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a39026244c97d5b8aab4ab7d4e18f3b766429e60c8d011fa063de4e82bfbf1a8',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
