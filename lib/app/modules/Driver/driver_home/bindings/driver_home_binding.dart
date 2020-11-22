import 'package:etrip/app/modules/Driver/driver_home/controllers/driver_home_controller.dart';
import 'package:get/get.dart';

class DriverHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverHomeController>(
      () => DriverHomeController(),
    );
  }
}
