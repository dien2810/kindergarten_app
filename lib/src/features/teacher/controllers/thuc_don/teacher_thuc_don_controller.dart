import 'package:get/get.dart';

class TeacherThucDonController extends GetxController{
  static TeacherThucDonController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
}