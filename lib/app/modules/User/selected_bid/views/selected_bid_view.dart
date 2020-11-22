import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:etrip/app/modules/User/selected_bid/controllers/selected_bid_controller.dart';

class SelectedBidView extends GetView<SelectedBidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SelectedBidView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SelectedBidView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  