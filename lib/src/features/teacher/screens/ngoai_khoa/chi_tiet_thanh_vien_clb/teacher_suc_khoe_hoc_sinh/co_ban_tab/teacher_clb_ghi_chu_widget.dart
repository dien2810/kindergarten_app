import 'package:flutter/material.dart';

import '../../../../../../../constants/sizes.dart';
import '../../../../../../../constants/text_strings.dart';
import '../../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';

class TeacherClbGhiChuWidget extends StatelessWidget {
  const TeacherClbGhiChuWidget({
    super.key,
    required this.controller,
  });

  final TeacherSucKhoeHocSinhController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: t150Size,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 0,
            color: Color(0x33000000),
            offset: Offset(0,1),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(t10Size),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              tGhiChu,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            TextFormField(
              controller: controller.ghiChu,
              maxLines: 2,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  hintText: tKhongCo,
                  hintStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),
                  focusColor: Colors.transparent,
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(t40Size)
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}