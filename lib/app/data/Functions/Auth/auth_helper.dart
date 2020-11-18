import 'dart:io';
import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthHelper {
  final storage = FlutterSecureStorage();
  final box = GetStorage();

  Future getToken() async {
    List tokens = await readToken();

    if (JwtDecoder.isExpired(tokens[0]) == false) {
      print('ACCESS TOKEN ALIVE');
      return tokens[0];
    } else {
      print('ACCESS TOKEN DEAD');
      if (JwtDecoder.isExpired(tokens[1]) == false) {
        print('refresh token is alive');
        try {
          var response = await ApiCalls().postRequest(
            body: {
              'refresh': tokens[1],
            },
            url: ApiData.refresh,
            headers: ApiData.jsonHeader,
          );

          if (response[0] == 200) {
            await storage.write(
                key: 'accesstoken', value: response[1]['access']);
            return response[1]['access'];
          } else {
            await CustomNotifiers().snackBar(
                'Error', 'Session Expired, Please Login again', Icons.error);
            await Get.offAllNamed(AppPages.LOGIN);
            return 'error';
          }
        } on Exception catch (e) {
          CustomNotifiers().snackBar('Error', e.toString(), Icons.error);
        }
      } else {
        print('Session Expired, Please Login again');
        await Get.offAllNamed(AppPages.LOGIN);
        return 'error';
      }
    }
  }

  checkLoginStatus() async {
    String loginToken = await storage.read(key: 'accesstoken');
    String refreshToken = await storage.read(key: 'refreshtoken');
    if (loginToken != null) {
      print('ACCESS TOKEN EXISTS');
      if (JwtDecoder.isExpired(loginToken) == false) {
        print('ACCESS TOKEN is LIVE');
        if (await box.read('is_document_cleared') == false) {
          Get.offAllNamed(AppPages.DRIVER_DETAILS);
          //TODO clear this value after adding data
        } else {
          Get.offAllNamed(AppPages.INITIAL);
        }
      } else {
        print('ACCESS TOKEN EXPIRED');

        if (JwtDecoder.isExpired(refreshToken) == false) {
          print('refresh token is alive');
          try {
            await ApiCalls().postRequest(body: {
              'refresh': refreshToken,
            }, url: ApiData.refresh, headers: ApiData.jsonHeader).then(
              (response) async {
                print(response[0]);
                if (response[0] == 200) {
                  print('new access token recieved');
                  await storage
                      .write(key: 'accesstoken', value: response[1]['access'])
                      .whenComplete(() => Get.offAllNamed('home'));
                } else {
                  print('error getting token');
                  Get.offAllNamed(AppPages.LOGIN);
                }
              },
            );
          } on SocketException catch (e) {
            print(e);
            CustomNotifiers().noInternet();
          }
        } else {
          print('refresh token expired you need to login again');
          Get.offAllNamed(AppPages.LOGIN);
        }
      }
    } else {
      print('no token found, you need to login again');
      Get.offAllNamed(AppPages.LOGIN);
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

  Future<List> readToken() async {
    return [
      await storage.read(key: 'accesstoken'),
      await storage.read(key: 'refreshtoken')
    ];
  }

  Future<String> readAccessToken() async {
    print(await storage.read(key: 'accesstoken'));
    return await storage.read(key: 'accesstoken');
  }
}
