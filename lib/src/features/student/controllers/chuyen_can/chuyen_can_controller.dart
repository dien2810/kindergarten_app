import 'package:get/get.dart';

class ChuyenCanController extends GetxController{
  static ChuyenCanController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
}