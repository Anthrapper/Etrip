import 'package:get/get.dart';
import 'package:etrip/app/modules/driver_details/controllers/driver_details_controller.dart';

class DriverDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverDetailsController>(
      () => DriverDetailsController(),
    );
  }
}
