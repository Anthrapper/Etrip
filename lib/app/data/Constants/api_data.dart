class ApiData {
  static const baseUrl = 'https://api.etrip.ml/';
  static const version = 'v1/';
  static const login = baseUrl + version + 'token/';
  static const refresh = baseUrl + version + 'token/refresh';
  static const signUp = baseUrl + version + 'user/registration';
  static const activation = baseUrl + version + 'user/activation';
  static const jsonHeader = {"Content-Type": "application/json"};
}
