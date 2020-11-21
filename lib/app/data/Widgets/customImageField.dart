import 'package:etrip/app/data/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageField extends StatelessWidget {
  final String text;
  final Function onTap;
  CustomImageField({@required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        right: Get.width * 0.085,
        left: Get.width * 0.085,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: (CustomColors.textField),
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        child: FlatButton(
          onPressed: () {
            this.onTap();
          },
          child: ListTile(
            title: Text(
              this.text,
              style: TextStyle(
                color: (CustomColors.hintText),
              ),
            ),
            trailing: Icon(Icons.upload_file),
          ),
        ),
      ),
    );
  }
}
