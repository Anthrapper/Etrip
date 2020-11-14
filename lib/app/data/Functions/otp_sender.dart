import 'package:etrip/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OtpSender {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void onVerifyCode(String phone, Function verificationUpdate) async {
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
          // Handle loogged in state
          print(value.user.phoneNumber);
          Get.offAllNamed(AppPages.LOGIN);
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
      // setState(() {
      //   isCodeSent = false;
      // });
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
        // Handle loogged in state
        print(value.user.phoneNumber);
        Get.back();
        await Get.offAllNamed(AppPages.LOGIN);
      } else {
        Get.snackbar("Error validating OTP, try again", 'Colors.red');
      }
    }).catchError((error) {
      Get.snackbar("Something went wrong", error.toString());
    });
  }
}
