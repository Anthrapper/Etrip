import 'package:etrip/app/modules/Driver/driver_details/controllers/driver_details_controller.dart';
import 'package:get/get.dart';

class DriverDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverDetailsController>(
      () => DriverDetailsController(),
    );
  }
}
