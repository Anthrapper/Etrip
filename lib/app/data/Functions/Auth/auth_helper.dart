import 'dart:async';
import 'dart:io';
import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthHelper {
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
            await Get.find<EtripServices>()
                .secStorage
                .write(key: 'accesstoken', value: response[1]['access']);
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
    String loginToken =
        await Get.find<EtripServices>().secStorage.read(key: 'accesstoken');
    String refreshToken =
        await Get.find<EtripServices>().secStorage.read(key: 'refreshtoken');
    if (loginToken != null) {
      print('ACCESS TOKEN EXISTS');
      if (JwtDecoder.isExpired(loginToken) == false) {
        print('ACCESS TOKEN is LIVE');
        Timer(
          Duration(
            milliseconds: 2300,
          ),
          () async {
            if (await Get.find<EtripServices>().box.read('user_type') ==
                'driver') {
              if (await Get.find<EtripServices>()
                      .box
                      .read('is_document_cleared') ==
                  false) {
                Get.offAllNamed(AppPages.DRIVER_DETAILS);
              } else {
                Get.offAllNamed(AppPages.DRIVER_HOME);
              }
            }
            if (await Get.find<EtripServices>().box.read('user_type') ==
                'user') {
              Get.offAllNamed(AppPages.INITIAL);
            }
            // else {
            //   Get.offAllNamed(AppPages.INITIAL);
            // }
          },
        );
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
                  await Get.find<EtripServices>()
                      .secStorage
                      .write(key: 'accesstoken', value: response[1]['access'])
                      .whenComplete(() async {
                    if (await Get.find<EtripServices>().box.read('user_type') ==
                        'driver') {
                      if (await Get.find<EtripServices>()
                              .box
                              .read('is_document_cleared') ==
                          false) {
                        Get.offAllNamed(AppPages.DRIVER_DETAILS);
                      } else {
                        Get.offAllNamed(AppPages.DRIVER_HOME);
                      }
                    }
                    if (await Get.find<EtripServices>().box.read('user_type') ==
                        'user') {
                      Get.offAllNamed(AppPages.INITIAL);
                    }
                  });
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

      Timer(
          Duration(
            milliseconds: 2300,
          ), () async {
        await Get.offAllNamed(AppPages.LOGIN);
      });
    }
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

  Future<List> readToken() async {
    return [
      await Get.find<EtripServices>().secStorage.read(key: 'accesstoken'),
      await Get.find<EtripServices>().secStorage.read(key: 'refreshtoken')
    ];
  }

  Future<String> readAccessToken() async {
    print(await Get.find<EtripServices>().secStorage.read(key: 'accesstoken'));
    return await Get.find<EtripServices>().secStorage.read(key: 'accesstoken');
  }
}
