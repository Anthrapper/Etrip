import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';

class ApiData {
  static const baseUrl = 'https://api.etrip.ml/';
  static const version = 'v1/';
  static const login = baseUrl + version + 'token/';
  static const refresh = baseUrl + version + 'token/refresh/';
  static const signUp = baseUrl + version + 'user/registration';
  static const activation = baseUrl + version + 'user/activation';
  static const vehiclesList = baseUrl + version + 'driver/vehicles';
  static const jsonHeader = {"Content-Type": "application/json"};
  static const driverSignUp = baseUrl + version + "driver/registration/basic";
  static const driverDetails = baseUrl + version + "driver/registration/docs";
  static const registeredVehicles =
      baseUrl + version + 'driver/vehicles/listed';
  static const vehicleReg = baseUrl + version + 'driver/vehicles/registration';
  static const mapApiKey = 'AIzaSyDVlIcJGpqZrY6UCC7s3YTIy22V9jTl7Cg';
  static const newTrip = baseUrl + version + 'user/trips/create';
  static const myTrips = baseUrl + version + 'user/trips/list';
  Future contentHeader() async {
    var loginToken = await AuthHelper().getToken();
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $loginToken',
    };
    return headers;
  }

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
