import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notificationList = [].obs;
  var isLoading = true.obs;

  Future getNotification() async {
    await ApiCalls()
        .getRequest(
            url: ApiData.notification, header: await ApiData().getHeader())
        .then((value) {
      print(value);
      if (value != null) {
        notificationList.assignAll(value);
        isLoading.value = false;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getNotification();
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
