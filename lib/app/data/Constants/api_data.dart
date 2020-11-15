import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';

class ApiData {
  static const baseUrl = 'https://api.etrip.ml/';
  static const version = 'v1/';
  static const login = baseUrl + version + 'token/';
  static const refresh = baseUrl + version + 'token/refresh';
  static const signUp = baseUrl + version + 'user/registration';
  static const activation = baseUrl + version + 'user/activation';
  static const vehiclesList = baseUrl + version + 'driver/vehicles';
  static const jsonHeader = {"Content-Type": "application/json"};
  Future getHeader() async {
    var loginToken = await AuthHelper().getToken();
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    return headers;
  }
}
