import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Functions/Auth/auth_helper.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: MediaQuery.of(context).size.width * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              color: HexColorUtils.getColorFromHex(CustomColors.buttonColor),
              height: MediaQuery.of(context).size.height * 0.33,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Trip',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Trip History',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 0.5,
                  // color: HexColorUtils.getColorFromHex(CustomColors.buttonColor1),
                ),
                FlatButton(
                  onPressed: () async {
                    await AuthHelper().removeToken().whenComplete(
                        () async => await Get.offAllNamed(AppPages.LOGIN));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
                    child: Row(
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                        ),
                        Icon(Icons.exit_to_app),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
