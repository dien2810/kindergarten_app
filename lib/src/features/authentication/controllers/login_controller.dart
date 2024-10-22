import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/guardian_navigation_menu/guardian_navigation_menu.dart';
import 'package:kindergarten_app/src/features/student/screens/homepage_news.dart';
import 'package:kindergarten_app/src/features/teacher/screens/trang_chu/trang_chu_giao_vien.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../screens/login_screen/login_screen.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final obscureText = true.obs;
  var role = Role.guardian.obs;
  final authRepo = Get.put(AuthenticationRepository());
  final accountRepo = Get.put(AccountRepository());
  final isLoading = false.obs;

  Future<void> login() async{
    try{
      isLoading.value = true;
      final emailText = email.text.trim();
      await authRepo.loginWithEmailAndPassword(emailText,password.text.trim());
      final account = await accountRepo.getAccountDetails(emailText);
      print("-------------------Role: "+account.role.toString());
      if (role.value == Role.guardian && account.role == Role.guardian) {
        Get.offAll(() => const GuardianNavigationMenu());
      } else if (role.value == Role.teacher && account.role == Role.teacher) {
        Get.offAll(() => const TrangChuGiaoVien());
      }
    } catch(e){
      isLoading.value = false;
      print(e.toString());
    }
  }


}