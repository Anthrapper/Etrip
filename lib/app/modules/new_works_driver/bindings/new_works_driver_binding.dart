import 'package:get/get.dart';
import 'package:etrip/app/modules/new_works_driver/controllers/new_works_driver_controller.dart';

class NewWorksDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewWorksDriverController>(
      () => NewWorksDriverController(),
    );
  }
}
