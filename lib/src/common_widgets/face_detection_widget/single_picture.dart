import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SinglePicture extends StatelessWidget {
  const SinglePicture({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const double mirror = math.pi;
    return SizedBox(
      width: width,
      height: height,
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(mirror),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.file(File(imagePath)),
          )),
    );
  }
}
