import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewWorksController extends GetxController {
  var newWork = [].obs;
  var isLoading = true.obs;

  Future getNewWorks() async {
    await ApiCalls()
        .getRequest(
      url: ApiData.newWork,
      header: await ApiData().getHeader(),
    )
        .then((value) {
      print(value);
      newWork.assignAll(value);
      isLoading.value = false;
    });
  }

  @override
  void onInit() {
    getNewWorks();
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
