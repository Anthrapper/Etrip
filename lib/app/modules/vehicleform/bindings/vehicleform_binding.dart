import 'package:get/get.dart';
import 'package:etrip/app/modules/vehicleform/controllers/vehicleform_controller.dart';

class VehicleformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleformController>(
      () => VehicleformController(),
    );
  }
}
