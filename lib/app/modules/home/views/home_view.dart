import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: newDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('HomeView', style: TextStyle(
          color: HexColorUtils.getColorFromHex(CustomColors.headings),
        ),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Center(child: Text('Carousel')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dots'),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){},
                        child: Container(
                          color: Colors.grey,
                          height: 40,
                          width: 300,
                          child: Center(
                            child: Text(
                              'My Trip'
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){},
                        child: Container(
                          color: Colors.grey,
                          height: 40,
                          width: 300,
                          child: Center(
                            child: Text(
                                'Trip History'
                            ),
                          ),
                  ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.gps_fixed),
        backgroundColor: HexColorUtils.getColorFromHex(CustomColors.buttonColor),
      ),
    );
  }

  Widget newDrawer() {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: 250,
      child: Center(
        child: Text('Drawer'),
      ),
    );
  }

  Widget carouselRough(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey,
              ),
              width: 300.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey,
              ),
              width: 300.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey,
              ),
              width: 300.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey,
              ),
              width: 300.0,
            ),
          ),
        ],
      ),
    );
  }

}
