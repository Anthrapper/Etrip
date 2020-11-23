import 'package:etrip/app/modules/Driver/Driver_MyTrip/controllers/driver_my_trip_controller.dart';
import 'package:get/get.dart';

class DriverMyTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverMyTripController>(
      () => DriverMyTripController(),
    );
  }
}
