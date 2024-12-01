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
      width: t10Size*6,
      height: t20Size+t5Size,
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