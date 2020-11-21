import 'package:etrip/app/modules/Driver/VehicleDetails/controllers/vehicle_details_controller.dart';
import 'package:get/get.dart';

class VehicleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleDetailsController>(
      () => VehicleDetailsController(),
    );
  }
}
