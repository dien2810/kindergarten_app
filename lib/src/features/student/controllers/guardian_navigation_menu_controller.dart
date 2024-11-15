import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/chat/chat_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/hoc_sinh_navigation/hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/news/homepage_news.dart';
import 'package:kindergarten_app/src/features/student/screens/tai_khoan/tai_khoan_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thong_bao/thong_bao_screen.dart';

class GuardianNavigationMenuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomepageNews(),
    const HocSinhScreen(),
    const ChatScreen(),
    const ThongBaoScreen(),
    const TaiKhoanScreen(),
  ];
}