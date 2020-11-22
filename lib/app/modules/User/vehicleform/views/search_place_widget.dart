import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/modules/User/vehicleform/controllers/vehicleform_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_map_place/search_map_place.dart';

class SearchWidget extends StatelessWidget {
  final bool fromCheck;
  SearchWidget({this.fromCheck});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Get.height * 0.02),
      height: Get.height * .5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: SearchMapPlaceWidget(
          iconColor: CustomColors.buttonColor,
          language: 'en',
          apiKey: ApiData.mapApiKey,
          hasClearButton: true,
          placeType: PlaceType.address,
          onSelected: (place) async {
            Geolocation geolocation = await place.geolocation;
            var location = geolocation.coordinates;
            print(location.latitude);
            print(location.longitude);
            if (fromCheck == true) {
              Get.find<VehicleformController>().fromDes.value =
                  place.fullJSON['terms'][0]['value'];
              Get.find<VehicleformController>().fromCo.value =
                  'Point(${location.longitude} ${location.latitude})';

              Get.back();
            } else {
              Get.find<VehicleformController>().toDes.value =
                  place.fullJSON['terms'][0]['value'];
              Get.find<VehicleformController>().toCo.value =
                  'Point(${location.longitude} ${location.latitude})';
              Get.back();
            }
          },
        ),
      ),
    );
  }
}
