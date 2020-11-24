import 'package:etrip/app/modules/Driver/driver_bids/controllers/driver_bids_controller.dart';
import 'package:get/get.dart';

class DriverBidsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverBidsController>(
      () => DriverBidsController(),
    );
  }
}
