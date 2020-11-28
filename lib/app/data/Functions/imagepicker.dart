import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePick {
  File _image;

  Future getImageFromGallery() async {
    final pickedFile = await Get.find<EtripServices>()
        .picker
        .getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      print(_image.path);
      Get.back();
      return _image.path;
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await Get.find<EtripServices>()
        .picker
        .getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      print(_image.path);
      Get.back();
      return _image.path;
    }
  }
}
