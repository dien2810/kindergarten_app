import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/chat/chat_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/hoc_sinh_navigation/hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/homepage/pages/homepage_news.dart';
import 'package:kindergarten_app/src/features/student/screens/notifications/pages/notifications.dart';
import 'package:kindergarten_app/src/features/student/screens/tai_khoan/tai_khoan_screen.dart';

class GuardianNavigationMenuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomePageWidget(),
    const HocSinhScreen(),
    const ChatScreen(),
    const NotificationsWidget(),
    const TaiKhoanScreen(),
  ];
}