import 'package:etrip/app/modules/Driver/Driver_MyTrip/controllers/driver_my_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverMyTripView extends GetView<DriverMyTripController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DriverMyTripView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DriverMyTripView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
