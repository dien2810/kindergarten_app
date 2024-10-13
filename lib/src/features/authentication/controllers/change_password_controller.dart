import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  static ChangePasswordController get instance => Get.find();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
}