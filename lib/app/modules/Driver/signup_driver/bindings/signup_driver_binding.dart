import 'package:etrip/app/modules/Driver/signup_driver/controllers/signup_driver_controller.dart';
import 'package:get/get.dart';

class SignupDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupDriverController>(
      () => SignupDriverController(),
    );
  }
}
