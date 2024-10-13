import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 230,
      height: 230,
      child: Image(image: AssetImage(tSplashImage)),
    );
  }
}