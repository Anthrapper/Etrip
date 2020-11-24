import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DriverBidsController extends GetxController {
  var bidList = [].obs;
  var isLoading = true.obs;
  var tripId = ''.obs;
  var buttonRemove = false.obs;
  Future selectBid(String bidId) async {
    print(tripId);
    await http
        .put(
      ApiData.selectBid + tripId.value,
      body: {
        "trip_status": 0.toString(),
        "selected_bid": bidId,
      },
      headers: await ApiData().contentHeader(),
    )
        .then((value) {
      print(value.body);
      if (Get.isDialogOpen) {
        Get.back();
      }
      Get.back();
    });
  }

  Future getBidList() async {
    print(Get.arguments);
    tripId.value = Get.arguments;
    await ApiCalls()
        .getRequest(
            url: ApiData.bidList + Get.arguments,
            header: await ApiData().getHeader())
        .then((value) {
      print(ApiData.bidList + Get.arguments);
      print(value);
      if (value != null) {
        bidList.assignAll(value);
        isLoading.value = false;
      }
    });
  }

  @override
  void onInit() {
    getBidList();
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
