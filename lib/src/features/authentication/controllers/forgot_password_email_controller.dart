import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordEmailController extends GetxController{
  static ForgotPasswordEmailController get instance => Get.find();
  final emailOrPhone = TextEditingController();
}