import 'package:etrip/app/data/Widgets/customwidgets.dart';
import 'package:etrip/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpSender {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void onVerifyCode(String phone, Function verificationUpdate) async {
    print(phone);
    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      verificationUpdate(verificationId);
      print('code sent successfully');
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      verificationUpdate(verificationId);
    };

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      print('verification success');
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user != null) {
          print(value.user.phoneNumber);
          if (Get.isBottomSheetOpen) {
            Get.back();
          }
          Get.offNamed(AppPages.LOGIN);
          CustomNotifiers().snackBar(
              'Success',
              'Your phone number has been successfully verified',
              Icons.check_box);
        } else {
          Get.snackbar("Error validating OTP", 'try again');
        }
      }).catchError((error) {
        Get.snackbar("Try again in sometime", 'try again');
      });
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      Get.snackbar('Error', authException.message);
    };

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91$phone",
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void onFormSubmitted(String otp, String vid) async {
    AuthCredential _authCredential = PhoneAuthProvider.credential(
      verificationId: vid,
      smsCode: otp,
    );

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) async {
      if (value.user != null) {
        if (Get.isBottomSheetOpen) {
          Get.back();
        }
        Get.offNamed(AppPages.LOGIN);
        CustomNotifiers().snackBar(
            'Success',
            'Your phone number has been successfully verified',
            Icons.check_box);
      } else {
        CustomNotifiers().snackBar(
          'Error',
          'Error verifying your mobile number, try again later',
          Icons.error,
        );
      }
    }).catchError((error) {
      Get.snackbar("Something went wrong", error.toString());
    });
  }
}
