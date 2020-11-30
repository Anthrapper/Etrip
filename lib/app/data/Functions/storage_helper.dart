import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:get/get.dart';

class StorageHelper {
  Future<List> readToken() async {
    return [
      await Get.find<EtripServices>().secStorage.read(key: 'accesstoken'),
      await Get.find<EtripServices>().secStorage.read(key: 'refreshtoken')
    ];
  }

  Future storeToken(String access, String refresh) async {
    await Get.find<EtripServices>()
        .secStorage
        .write(key: 'accesstoken', value: access);
    await Get.find<EtripServices>()
        .secStorage
        .write(key: 'refreshtoken', value: refresh);
  }

  Future removeToken() async {
    await Get.find<EtripServices>().secStorage.delete(key: 'accesstoken');
    await Get.find<EtripServices>().secStorage.delete(key: 'refreshtoken');
    print('successfully cleared the tokens');
  }

  Future<String> readAccessToken() async {
    print(await Get.find<EtripServices>().secStorage.read(key: 'accesstoken'));
    return await Get.find<EtripServices>().secStorage.read(key: 'accesstoken');
  }
}
