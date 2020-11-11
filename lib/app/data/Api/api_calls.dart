import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class ApiCalls {
  Future postRequest({
    @required Map<String, String> body,
    @required String url,
    @required Map<String, String> headers,
  }) async {
    try {
      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      return [response.statusCode, json.decode(response.body)];
    } on SocketException catch (e) {
      print(e);
      print('No internet');
    }
  }

  Future getRequest({var url, var header}) async {
    try {
      var response = await http.get(
        url,
        headers: header,
      );
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(response.statusCode);
      if (Get.isDialogOpen) {
        Get.back();
      }
      return [response.statusCode, jsonData];
    } on SocketException catch (e) {
      print(e);
      print('No internet');
    }
  }
}
