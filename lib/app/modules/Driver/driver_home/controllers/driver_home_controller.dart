import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class DriverHomeController extends GetxController {
  var currentIndex = 0.obs;
  var profileData = [].obs;

  indexChange(int index) {
    currentIndex.value = index;
  }

  Future getProfile() async {
    await ApiCalls()
        .getRequest(url: ApiData.profile, header: await ApiData().getHeader())
        .then((value) {
      print(value);
      profileData.assignAll(value);
    });
  }

  @override
  void onInit() {
    getProfile();
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
