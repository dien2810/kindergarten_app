import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/thong_tin_suc_khoe/thong_tin_suc_khoe_controller.dart';

class ChuanDoanWidget extends StatelessWidget {
  const ChuanDoanWidget({
    super.key,
    required this.controller,
  });

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: t150Size,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Color(0xFFE9EFF7),
            offset: Offset(0,1),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(t5Size),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.chanDoanCuaBacSi,
              maxLines: 3,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  hintText: tKhongCoBenhDangLoNgai,
                  hintStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
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