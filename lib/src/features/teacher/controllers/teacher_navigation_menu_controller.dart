import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/hoc_duong/screen/hoc_duong_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/tin_tuc/screen/teacher_tin_tuc_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thong_bao/screen/teacher_thong_bao_screen.dart';

import '../screens/chat/screen/chat_screen.dart';
import '../screens/tai_khoan/screen/tai_khoan_screen.dart';

class TeacherNavigationMenuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const TeacherTinTucScreen(),
    const HocDuongScreen(),
    const TeacherChatScreen(),
    const TeacherThongBaoScreen(),
    const TeacherTaiKhoanScreen(),
  ];
}