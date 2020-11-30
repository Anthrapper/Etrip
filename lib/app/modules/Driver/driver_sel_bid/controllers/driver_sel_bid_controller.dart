import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/constants.dart';
import 'package:get/get.dart';

class DriverSelBidController extends GetxController {
  var bidData = [].obs;
  var isLoading = true.obs;
  var nullChecker = true.obs;

  Future getSelectedBid() async {
    print(ApiData.selBidDriver + Get.arguments);
    await ApiCalls()
        .getRequest(
      url: ApiData.selBidDriver + Get.arguments,
      header: await ApiData().getHeader(),
    )
        .then(
      (value) {
        if (!value.isEmpty) {
          bidData.assignAll(value);
          print('assigned');
        } else {
          nullChecker.value = false;
          print('not assigned');
        }
        isLoading.value = false;
      },
    );
  }

  @override
  void onInit() {
    getSelectedBid();
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
