import 'package:geolocator/geolocator.dart';

class LocationHelper {
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude + position.accuracy + position.latitude);
    return position;
  }
}
