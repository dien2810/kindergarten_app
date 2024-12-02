import 'package:get/get.dart';

class TeacherGiangDayController extends GetxController{
  static TeacherGiangDayController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
}