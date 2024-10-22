import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/homepage_news.dart';

class GuardianNavigationMenuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomepageNews(),
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
  ];
}