import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';

class MyTripController extends GetxController {
  var myTrips = [].obs;

  Future getMyTrips() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.myTrips,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      print(value);
      myTrips.assignAll(value);
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
