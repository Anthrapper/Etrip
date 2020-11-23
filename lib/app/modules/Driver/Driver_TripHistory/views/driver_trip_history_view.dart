import 'package:etrip/app/modules/Driver/Driver_TripHistory/controllers/driver_trip_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverTripHistoryView extends GetView<DriverTripHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DriverTripHistoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DriverTripHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
