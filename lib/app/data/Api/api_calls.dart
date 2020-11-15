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

  Future getRequest({@required var url, @required var header}) async {
    try {
      var response = await http.get(
        url,
        headers: header,
      );
      print(header);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(response.statusCode);
      if (Get.isDialogOpen) {
        Get.back();
      }
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        print(response.statusCode);
        return [response.statusCode, jsonData];
      } else {
        return null;
      }
    } on SocketException catch (e) {
      print(e);
      print('No internet');
    }
  }
}
