import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex=0.obs;

   indexChange(int index){
    currentIndex.value = index;
  }

  @override
  void onInit() {
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

}
