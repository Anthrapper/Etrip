import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class DriverMyTripController extends GetxController {
  var myTrips = [].obs;
  var isLoading = true.obs;
  var selectFlag = false.obs;

  Future getMyTrips() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.driverBidList,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      print(value);
      myTrips.assignAll(value);
      isLoading.value = false;
    });
  }

  @override
  void onInit() {
    getMyTrips();
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
