import 'dart:async';
import 'dart:io';
import 'package:etrip/app/data/Api/api_calls.dart';
import 'package:etrip/app/data/Constants/api_data.dart';
import 'package:etrip/app/data/Functions/storage_helper.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum AccTokenStatus { AccTokenAlive, AccTokenDead }
enum RefTokenStatus { RefTokenAlive, RefTokenDead }
enum UserStatus { DriverVerified, DriverNonVerified, User }
enum Token { Exists, NotFound }

class AuthHelper {
  Future tokenRefresh(String ref) async {
    try {
      var response = await ApiCalls().postRequest(body: {
        'refresh': ref,
      }, url: ApiData.refresh, headers: ApiData.jsonHeader);

      if (response[0] == 200) {
        await Get.find<EtripServices>()
            .secStorage
            .write(key: 'accesstoken', value: response[1]['access']);
      }
      return response[0];
    } on SocketException catch (e) {
      print(e);
      CustomNotifiers().noInternet();
    }
  }

  tokenChecker() async {
    List tokens = await StorageHelper().readToken();
    if (tokens[0] == null) {
      return [Token.NotFound, null];
    } else {
      return [Token.Exists, tokens];
    }
  }

  userStatusChecker() async {
    if (await Get.find<EtripServices>().box.read('user_type') == 'driver') {
      if (await Get.find<EtripServices>().box.read('is_document_cleared') ==
          false) {
        return UserStatus.DriverNonVerified;
      } else {
        return UserStatus.DriverVerified;
      }
    }
    if (await Get.find<EtripServices>().box.read('user_type') == 'user') {
      return UserStatus.User;
    }
  }

  authChecker(List tokens) async {
    if (JwtDecoder.isExpired(tokens[0]) == false) {
      return [AccTokenStatus.AccTokenAlive, null];
    } else {
      return [AccTokenStatus.AccTokenDead, tokens[1]];
    }
  }

  refChecker(String ref) {
    if (JwtDecoder.isExpired(ref) == false) {
      return [RefTokenStatus.RefTokenAlive, ref];
    } else {
      return [RefTokenStatus.RefTokenDead, null];
    }
  }

  userSwitch(UserStatus userStatus) {
    switch (userStatus) {
      case UserStatus.DriverNonVerified:
        Get.find<EtripServices>().logger.i('non verified driver');
        Get.offAllNamed(AppPages.DRIVER_DETAILS);

        break;
      case UserStatus.DriverVerified:
        Get.find<EtripServices>().logger.i('verified driver');
        Get.offAllNamed(AppPages.DRIVER_HOME);

        break;
      case UserStatus.User:
        Get.find<EtripServices>().logger.i('USER ');
        Get.offAllNamed(AppPages.INITIAL);

        break;
    }
  }

  authenticationChecking() async {
    var tokenStatus = await tokenChecker();
    switch (tokenStatus[0]) {
      case Token.Exists:
        Get.find<EtripServices>().logger.i('TOKEN EXISTS');
        var tokenData = tokenStatus;
        var auth = await authChecker(tokenData[1]);

        switch (auth[0]) {
          case AccTokenStatus.AccTokenAlive:
            Get.find<EtripServices>().logger.i('ACCESS TOKEN ALIVE');
            userSwitch(await userStatusChecker());
            break;
          case AccTokenStatus.AccTokenDead:
            Get.find<EtripServices>().logger.i("ACCESS TOKEN DEAD");
            var refcheck = refChecker(auth[1]);
            switch (refcheck[0]) {
              case RefTokenStatus.RefTokenAlive:
                Get.find<EtripServices>().logger.i("REFRESH TOKEN ALIVE");
                var resp = await tokenRefresh(auth[1]);
                if (resp == 200) {
                  await userSwitch(await userStatusChecker());
                } else {
                  Get.find<EtripServices>().logger.e('ERROR GETTING NEW TOKEN');

                  Get.offAllNamed(AppPages.LOGIN);
                }
                break;
              case RefTokenStatus.RefTokenDead:
                Get.find<EtripServices>().logger.w("REFRESH TOKEN DEAD");
                Get.offAllNamed(AppPages.LOGIN);
            }
            break;
        }
        break;
      case Token.NotFound:
        Get.find<EtripServices>().logger.i('No Token Found !!');
        Get.offAllNamed(AppPages.LOGIN);
        break;
    }
  }

  Future getToken() async {
    List tokens = await StorageHelper().readToken();

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
      Get.find<EtripServices>().logger.i('ACCESS TOKEN EXISTS');
      if (JwtDecoder.isExpired(loginToken) == false) {
        Get.find<EtripServices>().logger.i('ACCESS TOKEN IS LIVE');
        Timer(
          Duration(
            milliseconds: 2500,
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
          },
        );
      } else {
        Get.find<EtripServices>().logger.w('ACCESS TOKEN EXPIRED');

        if (JwtDecoder.isExpired(refreshToken) == false) {
          Get.find<EtripServices>().logger.i('REFRESH TOKEN IS ALIVE');
          try {
            await ApiCalls().postRequest(body: {
              'refresh': refreshToken,
            }, url: ApiData.refresh, headers: ApiData.jsonHeader).then(
              (response) async {
                print(response[0]);
                if (response[0] == 200) {
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
                  Get.find<EtripServices>().logger.e('ERROR GETTING TOKEN');
                  Get.offAllNamed(AppPages.LOGIN);
                }
              },
            );
          } on SocketException catch (e) {
            print(e);
            CustomNotifiers().noInternet();
          }
        } else {
          Get.find<EtripServices>().logger.i('LOGIN AGAIN');
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
}
