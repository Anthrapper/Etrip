import 'package:etrip/app/modules/Driver/new_works_driver/controllers/new_works_driver_controller.dart';
import 'package:get/get.dart';

class NewWorksDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewWorksDriverController>(
      () => NewWorksDriverController(),
    );
  }
}
