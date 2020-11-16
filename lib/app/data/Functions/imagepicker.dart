import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePick {
  File _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    _image = File(pickedFile.path);
    print(_image.path);
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    _image = File(pickedFile.path);
    print(_image.path);
  }

}
