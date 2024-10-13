import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login_screen/login_screen.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  var role = Role.guardian.obs;
}