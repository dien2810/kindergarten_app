import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../screens/login_screen/login_screen.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  var role = Role.guardian.obs;

  //Call this Function from design and it will do the rest when click Submit
  void registerUser(String email, String password, Role role){
    role==Role.guardian
        ?AuthenticationRepository.instance.createGuardianWithEmailAndPassword(
        email, password)
        :AuthenticationRepository.instance.createTeacherWithEmailAndPassword(
        email, password);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  /*Future<void> createUser(UserModel user) async{
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(()=>const OTPScreen());
  }*/
}