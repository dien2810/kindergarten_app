import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/authentication/models/account_model.dart';

import '../../../repository/account_repository/account_repository.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../screens/login_screen/login_screen.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();
  final accountRepo = Get.put(AccountRepository());
  final fullname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  var role = Role.guardian.obs;

  //Call this Function from design and it will do the rest when click Submit
  void registerAccount(String email, String password, Role role){
    role==Role.guardian
        ?AuthenticationRepository.instance.createGuardianWithEmailAndPassword(
        email, password)
        :AuthenticationRepository.instance.createTeacherWithEmailAndPassword(
        email, password);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future<void> createAccount(AccountModel account) async{
    registerAccount(account.username, account.password, account.role);
    await accountRepo.createAccount(account);
  }
}