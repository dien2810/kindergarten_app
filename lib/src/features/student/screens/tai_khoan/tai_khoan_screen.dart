import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../authentication/controllers/login_controller.dart';

class TaiKhoanScreen1 extends StatelessWidget {
  const TaiKhoanScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(t10Size),
          child: Column(
            children: [
              const Center(child: Text("Tài khoản Phụ huynh")),
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
