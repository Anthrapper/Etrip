import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var vehicleData = [].obs;
  var isLoading = true.obs;
  var profileData = [].obs;
  var profileLoad = true.obs;
  var adImg = [].obs;
  var imgLoading = true.obs;

  Future getProfileData() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.profile,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      print(value);
      profileData.assignAll(value);
      profileLoad.value = false;
    });
  }

  Future getAds() async {
    await ApiCalls()
        .getRequest(url: ApiData.ads, header: await ApiData().getHeader())
        .then(
      (value) {
        print(value);
        adImg.assignAll(value);
        imgLoading.value = false;
      },
    );
  }

  Future getVehicleList() async {
    try {
      var vehicleList = await ApiCalls().getRequest(
        url: ApiData.vehiclesList,
        header: await ApiData().getHeader(),
      );
      if (vehicleList != null) {
        vehicleData.assignAll(vehicleList);
        isLoading.value = false;
      } else {
        isLoading.value = false;

        throw Exception('Failed to load cars');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await getAds();
    await getProfileData();
    await getVehicleList();
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
