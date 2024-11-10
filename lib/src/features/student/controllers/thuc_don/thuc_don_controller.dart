import 'package:get/get.dart';

class ThucDonController extends GetxController{
  static ThucDonController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
}