import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/screen/hoat_dong_su_kien_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/screen/ngoai_khoa_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/thuc_don_screen.dart';
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
      //home: const SplashScreen(),
      //home: const DanThuocScreen(),
      //home : const ThongTinHocSinhScreen(),
      //home: const ThucDonScreen(),
      //home: const NgoaiKhoaScreen(),
      home: const HoatDongSuKienScreen(),

      //home:  const DanhSachClbScreen(),
      //home: ThongTinSucKhoeScreen(),
      //home: const ThongTinSucKhoeScreen(),
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
