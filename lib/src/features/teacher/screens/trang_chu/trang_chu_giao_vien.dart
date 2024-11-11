import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../authentication/controllers/login_controller.dart';

class TrangChuGiaoVien extends StatelessWidget {
  const TrangChuGiaoVien({super.key});

  @override
  Widget build(BuildContext context) {
    // final auth = FirebaseAuth.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(t10Size),
          child: Column(
            children: [
              const Center(child: Text("Trang chủ Giáo Viên")),
              TextButton(
                onPressed: () {
                  // await auth.signOut();
                  final loginController = Get.put(LoginController());
                  loginController.signOut();
                },
                child: const Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}