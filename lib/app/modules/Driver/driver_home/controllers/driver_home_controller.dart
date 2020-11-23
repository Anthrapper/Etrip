import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/location_helper.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DriverHomeController extends GetxController {
  var currentIndex = 0.obs;
  var profileData = [].obs;
  var fromCo = ''.obs;

  indexChange(int index) {
    currentIndex.value = index;
  }

  Future updateLoc() async {
    await LocationHelper().getUserLocation(fromCo);

    await http.put(
      ApiData.updateLocation,
      headers: await ApiData().contentHeader(),
      body: {'current_place_coordinates': fromCo.value},
    ).then((value) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      print(value.body);
      Get.toNamed(AppPages.NEW_WORKS);
    });
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
