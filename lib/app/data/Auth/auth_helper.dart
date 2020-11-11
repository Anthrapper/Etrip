import 'dart:convert';
import 'dart:io';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class AuthHelper {
  final storage = FlutterSecureStorage();
  checkLoginStatus() async {
    String loginToken = await storage.read(key: 'accesstoken');
    String refreshToken = await storage.read(key: 'refreshtoken');
    if (loginToken != null) {
      print('ACCESS TOKEN EXISTS');
      if (JwtDecoder.isExpired(loginToken) == false) {
        print('ACCESS TOKEN is LIVE');
        Get.offAllNamed('home');
      } else {
        print('ACCESS TOKEN EXPIRED');

        if (JwtDecoder.isExpired(refreshToken) == false) {
          print('refresh token is alive');

          Map data = {
            'refresh': refreshToken,
          };
          try {
            var response = await http.post(
              ApiData.refresh,
              body: jsonEncode(data),
              headers: ApiData.jsonHeader,
            );
            var jsonData = json.decode(response.body);
            print(jsonData);
            if (response.statusCode == 200) {
              print('new access token recieved');
              await storage.write(
                  key: 'accesstoken', value: jsonData['access']);

              Get.offAllNamed('home');
            } else {
              print('error getting token');
              Get.offAllNamed('apphome');
            }
          } on SocketException catch (e) {
            print(e);
            CustomSnackbars().noInternet();
          }
        } else {
          print('refresh token expired you need to login again');
          Get.offAllNamed('apphome');
        }
      }
    } else {
      print('no token found, you need to login again');
      Get.offAllNamed('apphome');
    }
  }

  Future storeToken(String access, String refresh) async {
    await storage.write(key: 'accesstoken', value: access);
    await storage.write(key: 'refreshtoken', value: refresh);
  }

  Future removeToken() async {
    await storage.delete(key: 'accesstoken');
    await storage.delete(key: 'refreshtoken');
    print('successfully cleared the tokens');
  }

  Future<String> readAccessToken() async {
    print(await storage.read(key: 'accesstoken'));
    return await storage.read(key: 'accesstoken');
  }
}
