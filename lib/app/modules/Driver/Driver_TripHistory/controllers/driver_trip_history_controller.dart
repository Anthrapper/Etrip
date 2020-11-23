import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class DriverTripHistoryController extends GetxController {
  var tripHistory = [].obs;
  var isLoading = true.obs;

  Future getTripHistory() async {
    await ApiCalls()
        .getRequest(url: null, header: await ApiData().getHeader())
        .then((value) {
      print(value);
      if (value != null) {
        tripHistory.assignAll(value);
        isLoading.value = false;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getTripHistory();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
