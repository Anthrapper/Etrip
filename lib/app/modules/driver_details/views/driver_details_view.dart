import 'package:etrip/app/data/Constants/colors.dart';
import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:etrip/app/data/Functions/hexcolors.dart';
import 'package:etrip/app/data/Widgets/customButton.dart';
import 'package:etrip/app/data/Widgets/customform.dart';
import 'package:etrip/app/data/Widgets/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:etrip/app/modules/driver_details/controllers/driver_details_controller.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class DriverDetailsView extends GetView<DriverDetailsController> {
  List _myActivities;
  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void onInit() {
    onInit();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      // setState(() {
      //   _myActivitiesResult = _myActivities.toString();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColorUtils.getColorFromHex(
        CustomColors.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logo(),
              heading(),
              form(),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.03, bottom: Get.height * 0.05),
                child: button(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.08, 0, 0),
      child: CircleAvatar(
        backgroundColor: HexColorUtils.getColorFromHex(
          CustomColors.circleAvatar,
        ),
        radius: Get.width * 0.11,
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.01, 0, 0),
      child: Text(
        'Sign Up',
        style: CustomTextStyles().headingStyle,
      ),
    );
  }

  Widget button() {
    return Center(
      child: CustomButton(
          text: 'Submit',
          onpressed: () {
            CustomNotifiers().progressIndicator();
            controller.doDetailsSubmit();
          }),
    );
  }

  Widget form() {
    return Padding(
      padding:
          EdgeInsets.only(top: Get.height * 0.1, bottom: Get.height * 0.03),
      child: Form(
        key: controller.formKey2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CustomTextField(
                suffixChecker: true,
                controller: controller.licenseNum,
                hintText: 'Enter license number',
                secureText: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, right: Get.width * 0.085, left: Get.width * 0.085),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColorUtils.getColorFromHex(CustomColors.textField),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: ListTile(
                    title: Text(
                      'Upload your photo',
                      style: TextStyle(
                        color: HexColorUtils.getColorFromHex(
                            CustomColors.hintText),
                      ),
                    ),
                    trailing: Icon(Icons.upload_file),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: 20.0, right: Get.width * 0.085, left: Get.width * 0.085),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: HexColorUtils.getColorFromHex(CustomColors.textField),
            //       borderRadius: BorderRadius.all(Radius.circular(13)),
            //     ),
            //     child: FlatButton(
            //       onPressed: () {},
            //       child: ListTile(
            //         title: Text(
            //           'Upload your Vehicle’s photo',
            //           style: TextStyle(
            //             color: HexColorUtils.getColorFromHex(
            //                 CustomColors.hintText),
            //           ),
            //         ),
            //         trailing: Icon(Icons.upload_file),
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.only(top: 20.0, right: Get.width * 0.085, left: Get.width * 0.085),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MultiSelectFormField(
                  autovalidate: false,
                  chipBackGroundColor: HexColorUtils.getColorFromHex(CustomColors.buttonColor1),
                  chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.red,
                  checkBoxCheckColor: Colors.green,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Vehicles",
                    style: TextStyle(fontSize: 16),
                  ),
                  dataSource: [
                    {
                      "display": "Car",
                      "value": "Car",
                    },
                    {
                      "display": "Bus",
                      "value": "Bus",
                    },
                    {
                      "display": "Lorry",
                      "value": "Lorry",
                    },
                    {
                      "display": "Auto",
                      "value": "Auto",
                    },
                    {
                      "display": "MiniBus",
                      "value": "MiniBus",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Please select your vehicles'),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    // Obx( ()=>
                    //   _myActivities = value
                    // ),
                    Obx(
                          () => _myActivities = value
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
