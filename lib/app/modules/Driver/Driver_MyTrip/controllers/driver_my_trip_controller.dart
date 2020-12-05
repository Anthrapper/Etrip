import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class DriverMyTripController extends GetxController {
  var myTrips = [].obs;
  var isLoading = true.obs;
  var selectFlag = false.obs;
  var noItems = false.obs;

  Future getMyTrips() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.driverBidList,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      if (value != null) {
        myTrips.assignAll(value);
        isLoading.value = false;
        if (myTrips.length == 0) {
          noItems.value = true;
        }
      } else {
        getMyTrips();
      }
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
