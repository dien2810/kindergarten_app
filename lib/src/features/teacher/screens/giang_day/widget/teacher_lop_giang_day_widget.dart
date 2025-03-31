import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/models/classes/classes_model.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/giang_day/teacher_giang_day_controller.dart';

import '../screen/teacher_danh_sach_hoc_sinh_screen.dart';

class TeacherLopGiangDayWidget extends StatelessWidget {
  final ClassesModel classItem;
  final String lopName;
  final int soLuong;
  final String thoiGianBatDau;
  final String thoiGianKetThuc;

  const TeacherLopGiangDayWidget({
    super.key,
    required this.classItem,
    required this.lopName,
    required this.soLuong,
    required this.thoiGianBatDau,
    required this.thoiGianKetThuc,
  });

  @override
  Widget build(BuildContext context) {
    final giangDayController = Get.put(TeacherGiangDayController());
    return GestureDetector(
      onTap: () {
        giangDayController.classModel = classItem;
        // Chuyển sang trang danh sách học sinh
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeacherDanhSachHocSinhScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: const Color(0xFFB5179E), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(t15Size),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lopName,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7209B7),
                      ),
                    ),
                    SizedBox(height: t10Size),
                    Text(
                      'Số lượng: $soLuong học sinh',
                      style: const TextStyle(
                        color: Color(0xFFB5179E),
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: t5Size),
                    Text(
                      '$thoiGianBatDau - $thoiGianKetThuc',
                      style: const TextStyle(
                        color: Color(0xFFB5179E),
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: t15Size),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFB5179E),
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}