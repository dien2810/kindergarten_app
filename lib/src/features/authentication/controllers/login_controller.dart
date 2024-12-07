import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/guardian_navigation_menu/guardian_navigation_menu.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../teacher/screens/teacher_navigation_menu/teacher_navigation_menu.dart';
import '../screens/login_screen/login_screen.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  final username = TextEditingController();
  final password = TextEditingController();
  final obscureText = true.obs;
  var role = Role.guardian.obs;
  // final authRepo = Get.put(AuthenticationRepository());
  final accountRepo = Get.put(AccountRepository());
  final isLoading = false.obs;

  Future<void> login() async{
    try{
      isLoading.value = true;
      final usernameText = username.text.trim();
      //await authRepo.loginWithEmailAndPassword(emailText,password.text.trim());
      final account = await accountRepo.getAccountDetails(usernameText);
      print("-------------------Role: ${account.role}");
      if (role.value == Role.guardian && account.role == Role.guardian && account.password == password.text ) {
        accountRepo.userId = account.username;
        accountRepo.fullName = account.fullname;
        Get.offAll(() => const GuardianNavigationMenu());
      } else if (role.value == Role.teacher && account.role == Role.teacher
          && account.password == password.text) {
        accountRepo.userId = account.username;
        accountRepo.fullName = account.fullname;
        Get.offAll(() => const TeacherNavigationMenu());
      }
      else{
        Helper.errorSnackBar(
          title: 'Đăng nhập thất bại',
          message: 'Tên đăng nhập hoặc mật khẩu không đúng'
        );
      }
    } catch(e){
      isLoading.value = false;
      Helper.errorSnackBar(
          title: 'Đăng nhập thất bại',
          message: e.toString()
      );
      print(e.toString());
    }
  }

  void signOut(){
    accountRepo.userId = '';
    accountRepo.fullName = '';
    Get.offAll(()=>const LoginScreen());
  }


}