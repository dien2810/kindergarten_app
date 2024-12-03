import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/hoc_duong/screen/hoc_duong_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/tin_tuc/screen/teacher_tin_tuc_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/trang_chu/trang_chu_giao_vien.dart';

import '../screens/thong_bao/screen/teacher_thong_bao_screen.dart';

class TeacherNavigationMenuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const TeacherTinTucScreen(),
    const HocDuongScreen(),
    Container(color: Colors.purple),
    const TeacherThongBaoScreen(),
    const TrangChuGiaoVien(),
  ];
}