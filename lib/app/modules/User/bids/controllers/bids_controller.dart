import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';

class BidsController extends GetxController {
  var bidList = [].obs;
  var isLoading = true.obs;
  selectBid() {
    print('bid selected');
    Get.back();
  }

  Future getBidList() async {
    print(Get.arguments);
    await ApiCalls()
        .getRequest(
            url: ApiData.bidList + Get.arguments,
            header: await ApiData().getHeader())
        .then((value) {
      print(value);
      bidList.assignAll(value);
      isLoading.value = false;
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
