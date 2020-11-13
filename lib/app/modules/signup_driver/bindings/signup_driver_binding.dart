import 'package:get/get.dart';
import 'package:etrip/app/modules/signup_driver/controllers/signup_driver_controller.dart';

class SignupDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupDriverController>(
      () => SignupDriverController(),
    );
  }
}
