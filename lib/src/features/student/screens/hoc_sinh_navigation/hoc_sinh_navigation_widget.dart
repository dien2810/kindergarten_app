import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class HocSinhNavigationWidget extends StatelessWidget {
  const HocSinhNavigationWidget({
    super.key, required this.imageString, required this.title, required this.onTap,
  });
  final String imageString;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: t50Size,
              height: t50Size,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 14
              ),
            )
          ],
        ),
      );
  }
}