import 'package:flutter/material.dart';

class RoundedAssetImageWidget extends StatelessWidget {
  const RoundedAssetImageWidget({
    super.key, required this.width, required this.height, required this.image,
  });
  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}