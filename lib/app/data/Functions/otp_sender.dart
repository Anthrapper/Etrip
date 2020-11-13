import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OtpSender {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // setState(() {
  //   isCodeSent = true;
  // });

  final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    var id = verificationId;
    print(id);
    // setState(() {
    //   _verificationId = verificationId;
    // });
  };
  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    var id = verificationId;
    // setState(() {
    //   _verificationId = verificationId;
    // });
    print(id);
  };
  void onVerifyCode(String phone) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user != null) {
          // Handle loogged in state
          print(value.user.phoneNumber);
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
        phoneNumber: "+917012595875",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
