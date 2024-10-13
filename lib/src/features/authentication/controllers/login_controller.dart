import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login_screen/login_screen.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  var role = Role.guardian.obs;


}