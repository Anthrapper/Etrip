import 'package:etrip/app/modules/User/vehicleform/controllers/vehicleform_controller.dart';
import 'package:get/get.dart';

class VehicleformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleformController>(
      () => VehicleformController(),
    );
  }
}
