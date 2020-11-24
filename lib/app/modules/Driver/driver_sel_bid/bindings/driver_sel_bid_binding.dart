import 'package:etrip/app/modules/Driver/driver_sel_bid/controllers/driver_sel_bid_controller.dart';
import 'package:get/get.dart';

class DriverSelBidBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DriverSelBidController());
  }
}
