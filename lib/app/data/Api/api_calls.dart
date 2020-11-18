import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class ApiCalls {
  Future postRequest({
    @required Map<String, dynamic> body,
    @required String url,
    @required Map<String, String> headers,
  }) async {
    try {
      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      print(url);
      print(response.statusCode);

      print(response.body);
      print(response.statusCode);
      return [response.statusCode, json.decode(response.body)];
    } on SocketException catch (e) {
      print(e);
      print('No internet');
    }
  }

  Future getRequest({@required var url, @required var header}) async {
    try {
      var response = await http.get(
        url,
        headers: header,
      );

      if (Get.isDialogOpen) {
        Get.back();
      }
      print(response.statusCode);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } on SocketException catch (e) {
      print(e);
      print('No internet');
    }
  }
}
