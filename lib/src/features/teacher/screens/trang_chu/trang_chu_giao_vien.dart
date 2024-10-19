import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class TrangChuGiaoVien extends StatelessWidget {
  const TrangChuGiaoVien({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(t10Size),
          child: Column(
            children: [
              const Center(child: Text("Trang chủ Giáo Viên")),
              TextButton(
                onPressed: () async {await auth.signOut();},
                child: const Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}