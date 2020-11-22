import 'package:get/get.dart';

class VehicleformController extends GetxController {
  var toCo = ''.obs;
  var fromDes = 'from'.tr.obs;
  var toDes = 'to'.tr.obs;
  var vehicleType = ''.obs;
  var readDate = 'date'.tr.obs;
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
