import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class DanThuocStatusWidget extends StatelessWidget {
  const DanThuocStatusWidget({
    super.key, required this.status, required this.color,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: t10Size*7.5,
      height: t30Size,
      padding: EdgeInsets.symmetric(horizontal: t5Size),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color
      ),
      child: Center(
        child: Text(
          status,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}