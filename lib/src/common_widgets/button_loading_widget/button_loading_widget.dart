import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

class Buttonloadingwidget extends StatelessWidget {
  const Buttonloadingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: t20Size,
          height: t20Size,
          child: CircularProgressIndicator(color: Colors.white,)
        ),
        SizedBox(width: t10Size),
        Text("Loading...")
      ],
    );
  }
}
