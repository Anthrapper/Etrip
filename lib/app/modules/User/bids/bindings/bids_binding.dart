import 'package:get/get.dart';
import 'package:etrip/app/modules/User/bids/controllers/bids_controller.dart';

class BidsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BidsController>(
      () => BidsController(),
    );
  }
}
