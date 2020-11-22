import 'package:get/get.dart';
import 'package:etrip/app/modules/Driver/new_works/controllers/new_works_controller.dart';

class NewWorksBinding extends Bindings {
  @override
  void dependencies() {
    Get.put (NewWorksController(),
    );
  }
}
