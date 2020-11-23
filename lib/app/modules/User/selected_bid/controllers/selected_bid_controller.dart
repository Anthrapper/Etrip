import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class SelectedBidController extends GetxController {
  var bidData = [].obs;
  var isLoading = true.obs;

  Future getSelectedBid() async {
    await ApiCalls()
        .getRequest(url: null, header: await ApiData().getHeader())
        .then((value) {
      print(value);
      bidData.assignAll(value);
      isLoading.value = false;
    });
  }

  @override
  void onInit() {
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
