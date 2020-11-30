import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';

class TripHistoryController extends GetxController {
  var tripHistory = [].obs;
  var isLoading = true.obs;
  Future getTripHistory() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.tripHistory,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      if (value != null) {
        tripHistory.assignAll(value);
        isLoading.value = false;
      } else {
        getTripHistory();
      }
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
  void onClose() {}
}
