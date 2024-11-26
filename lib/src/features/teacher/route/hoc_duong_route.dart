
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/dan_thuoc/screen/teacher_dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/hoc_duong/screen/hoc_duong_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thuc_don/screen/teacher_thuc_don_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/trang_chu/trang_chu_giao_vien.dart';

class HocDuongRoutes {
  static final routes = [
    GetPage(name: '/HocDuong', page: () => const HocDuongScreen()),
    GetPage(name: '/TeacherDanThuoc', page: () => const TeacherDanThuocScreen()),
    GetPage(name: '/TeacherThucDon', page: () => const TeacherThucDonScreen())
  ];
}
