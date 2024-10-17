import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class TrangChuGiaoVien extends StatelessWidget {
  const TrangChuGiaoVien({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(t10Size),
          child: const Center(child: Text("Trang chủ Guardian")),
        ),
      ),
    );
  }
}