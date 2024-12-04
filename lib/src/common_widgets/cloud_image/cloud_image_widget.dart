import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:flutter/material.dart';


class CloudImage extends StatelessWidget {
  const CloudImage({
    super.key, required this.publicId, this.width = 300, this.height = 300,
    this.fit = false
  });
  final String publicId;
  final double? width;
  final double? height;
  final bool fit;

  @override
  Widget build(BuildContext context) {
    return CldImageWidget(
      fit: fit?BoxFit.cover:BoxFit.none,
      publicId: publicId,
      transformation: Transformation()
        ..resize(Resize.crop()
          ..width(width)
          ..height(height))
    );
  }
}