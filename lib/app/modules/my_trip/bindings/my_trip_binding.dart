import 'package:get/get.dart';
import 'package:etrip/app/modules/my_trip/controllers/my_trip_controller.dart';

class MyTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTripController>(
      () => MyTripController(),
    );
  }
}
