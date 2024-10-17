import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

class HomepageNews extends StatelessWidget {
  const HomepageNews({super.key});

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
