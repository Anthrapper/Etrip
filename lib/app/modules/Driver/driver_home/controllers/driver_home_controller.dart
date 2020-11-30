import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Functions/location_helper.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DriverHomeController extends GetxController {
  var profileData = [].obs;
  var fromCo = ''.obs;
  var isLoading = true.obs;
  var adImg = [].obs;
  var imgLoading = true.obs;

  Future getAds() async {
    await ApiCalls()
        .getRequest(url: ApiData.ads, header: await ApiData().getHeader())
        .then(
      (value) {
        if (value != null) {
          adImg.assignAll(value);
          imgLoading.value = false;
        } else {
          getAds();
        }
      },
    );
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
      if (value != null) {
        profileData.assignAll(value);
        isLoading.value = false;
      } else {
        getProfile();
      }
    });
  }

  @override
  void onInit() {
    getAds();
    getProfile();
    super.onInit();
  }

  @override
  void onReady() {
    Get.find<EtripServices>().fcm.configure();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
