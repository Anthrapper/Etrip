import 'package:etrip/app/modules/Driver/Driver_TripHistory/controllers/driver_trip_history_controller.dart';
import 'package:get/get.dart';

class DriverTripHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverTripHistoryController>(
      () => DriverTripHistoryController(),
    );
  }
}
