import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/services.dart';

class LocationHelper {
  getUserLocation(RxString fromCo, {RxString fromDes}) async {
    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    if (fromDes != null) {
      fromDes.value = '${first.locality}';
      print(fromDes);
      CustomNotifiers().snackBar(
          'Location',
          '${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}',
          Icons.location_pin);
    }
    fromCo.value = 'Point(${coordinates.longitude} ${coordinates.latitude})';
    print(fromCo);

    return first;
  }
}
