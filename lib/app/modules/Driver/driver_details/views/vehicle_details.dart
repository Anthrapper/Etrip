// import 'package:etrip/app/data/Constants/constants.dart';
// import 'package:etrip/app/data/Widgets/customwidgets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class VehicleDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.background,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               LogoWidget(),
//               heading(),
//               form(),
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: Get.height * 0.03,
//                   bottom: Get.height * 0.05,
//                 ),
//                 child: button(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget form() {
//     return Padding(
//         padding:
//             EdgeInsets.only(top: Get.height * 0.1, bottom: Get.height * 0.03),
//         child: Form(
//           key: controller.formKey2,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: 20.0,
//                   right: Get.width * 0.085,
//                   left: Get.width * 0.085,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: (CustomColors.textField),
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                   ),
//                   child: FlatButton(
//                     onPressed: () {
//                       CustomNotifiers().uploadSelection(controller.photo);
//                     },
//                     child: ListTile(
//                       title: Text(
//                         'Upload your photo',
//                         style: TextStyle(
//                           color: (CustomColors.hintText),
//                         ),
//                       ),
//                       trailing: Icon(Icons.upload_file),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }

//   Widget heading() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(Get.width * 0.1, Get.height * 0.01, 0, 0),
//       child: Text(
//         'Sign Up',
//         style: CustomTextStyles().headingStyle,
//       ),
//     );
//   }

//   Widget button() {
//     return Center(
//       child: CustomButton(
//           text: 'Submit',
//           onpressed: () {
//             CustomNotifiers().progressIndicator();
//             // controller.photoUpload();
//           }),
//     );
//   }
// }
