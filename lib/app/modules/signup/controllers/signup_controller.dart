import 'package:etrip/app/data/Constants/text_styles.dart';
import 'package:etrip/app/data/Functions/otp_sender.dart';
import 'package:etrip/app/data/Widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class SignupController extends GetxController {
  final count = 0.obs;
  TextEditingController email;
  TextEditingController name;
  TextEditingController confPass;
  TextEditingController password;
  var showText = true.obs;
  var en = true.obs;
  var ml = false.obs;
  final formKey = GlobalKey<FormState>();

  Future doSignUp() async {
    print('Signed in');
    OtpSender().onVerifyCode('7012595875');

    // Get.bottomSheet(submitOtp());
  }

  obscure() {
    print('called ');
    print(showText.value);

    if (showText.value == false) {
      showText.value = true;
    } else {
      showText.value = false;
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget submitOtp() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PinEntryTextField(
              fields: 4,
              fieldWidth: 60.0,
              fontSize: 30.0,
              showFieldAsBox: false,
              onSubmit: (String pin) {
                print(pin);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Please enter 4-digit code sent to your number as SMS',
              textAlign: TextAlign.center,
              style: CustomTextStyles().smallText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CustomButton(
                text: 'SIGNUP',
                onpressed: doSignUp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
