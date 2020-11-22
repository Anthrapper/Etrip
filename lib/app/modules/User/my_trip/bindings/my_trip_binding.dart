import 'package:etrip/app/modules/User/my_trip/controllers/my_trip_controller.dart';
import 'package:get/get.dart';

class MyTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyTripController());
  }
}
