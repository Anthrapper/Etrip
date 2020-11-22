import 'package:get/get.dart';
import 'package:etrip/app/modules/User/selected_bid/controllers/selected_bid_controller.dart';

class SelectedBidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectedBidController>(
      () => SelectedBidController(),
    );
  }
}
