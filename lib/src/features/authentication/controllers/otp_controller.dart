import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../screens/forget_password/change_password/change_password_screen.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();
  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.to(()=>const ChangePasswordScreen()) : Get.back();
  }
}