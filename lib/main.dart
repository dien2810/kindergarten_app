import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/screen/hoat_dong_su_kien_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/screen/ngoai_khoa_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/thuc_don_screen.dart';
import 'package:kindergarten_app/src/features/teacher/routes/hoc_duong_route.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/ho_so_y_te/teacher_danh_sach_lich_su_tiem_chung_widget.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/teacher_thong_tin_suc_khoe_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_thong_tin_hoc_sinh/screen/teacher_thong_tin_ca_nhan_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/dan_thuoc/screen/teacher_dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/screen/teacher_danh_sach_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/screen/teacher_giang_day_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/hoc_duong/screen/hoc_duong_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thong_bao/screen/teacher_thong_bao_screen.dart';
import 'package:kindergarten_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kindergarten_app/src/utils/theme.dart';
import 'firebase_options.dart';
import 'package:kindergarten_app/src/features/student/screens/health/thong_tin_suc_khoe_screen.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kindergarten App',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // đường dẫn của học đường bên giáo viên
      initialRoute: '/HocDuong',
      getPages: HocDuongRoutes.routes,
      //home: const TeacherThongBaoScreen(sentBy: "teacher_id_1"),
      //home:ThongTinSucKhoeScreen() ,
      //home: const TeacherThongTinSucKhoeHocSinhScreen(studentName: 'sss', imageUrl: tHocSinhAvatarItem3),
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
