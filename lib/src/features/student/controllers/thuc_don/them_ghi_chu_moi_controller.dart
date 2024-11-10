import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

class ThemGhiChuMoiController extends GetxController{
  static ThemGhiChuMoiController get instance => Get.find();
  final noiDungGhiChu = TextEditingController();
}