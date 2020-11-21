import 'package:get/get.dart';

class VehicleformController extends GetxController {
  var toCo = ''.obs;
  var fromDes = 'From'.obs;
  var toDes = 'To'.obs;
  var vehicleType = ''.obs;
  var readDate = 'Date'.obs;
  var passDate = ''.obs;
  @override
  void onInit() {
    vehicleType.value = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future submitForm() async {
    print(toCo.value);
  }
}
