import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/authentication/controllers/login_controller.dart';

class HomepageNews extends StatelessWidget {
  const HomepageNews({super.key});

  @override
  Widget build(BuildContext context) {
    // final auth = FirebaseAuth.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(t10Size),
            child: Column(
              children: [
                const Center(child: Text("Trang chủ Guardian")),
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
