import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';

class AuthenticationBackgroundWidget extends StatelessWidget {
  const AuthenticationBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(tLoginBackground), fit: BoxFit.cover)),
    );
  }
}