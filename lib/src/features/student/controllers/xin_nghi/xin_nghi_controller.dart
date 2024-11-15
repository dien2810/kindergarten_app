import 'package:get/get.dart';

class XinNghiController extends GetxController{
  static XinNghiController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
}