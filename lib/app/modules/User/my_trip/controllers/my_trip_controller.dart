import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:http/http.dart' as http;
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';

class MyTripController extends GetxController {
  var myTrips = [].obs;
  var isLoading = true.obs;

  Future tripCompleted(String id) async {
    await http
        .put(ApiData.updateCompleted + id,
            body: {
              "trip_status": 4.toString(),
            },
            headers: await ApiData().contentHeader())
        .then((value) async {
      print(value.body);

      if (Get.isDialogOpen) {
        Get.back();
      }
      await getMyTrips();
    });
  }

  Future getMyTrips() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.myTrips,
      header: await ApiData().getHeader(),
    )
        .then(
      (value) {
        if (value != null) {
          myTrips.assignAll(value);
          isLoading.value = false;
        } else {
          getMyTrips();
        }
      },
    );
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
