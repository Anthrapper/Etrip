import 'package:flutter/material.dart';

class CarouselView extends StatelessWidget {
  final String imgUrl;
  CarouselView({this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        this.imgUrl,
        fit: BoxFit.fill,
        alignment: Alignment.center,
      ),
    );
  }
}
