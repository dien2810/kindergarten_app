import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/trang_chu/trang_chu_giao_vien.dart';

class TeacherNavigationMenuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const TrangChuGiaoVien(),
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
  ];
}