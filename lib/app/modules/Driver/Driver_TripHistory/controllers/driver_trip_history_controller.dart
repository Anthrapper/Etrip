import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class DriverTripHistoryController extends GetxController {
  var tripHistory = [].obs;
  var isLoading = true.obs;

  Future getTripHistory() async {
    print(ApiData.tripCompletedDriver);
    await ApiCalls()
        .getRequest(
            url: ApiData.tripCompletedDriver,
            header: await ApiData().getHeader())
        .then((value) {
      print(value);

      tripHistory.assignAll(value);
      isLoading.value = false;
    });
  }

  @override
  void onInit() {
    getTripHistory();

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
