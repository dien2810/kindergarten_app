import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/widget/clb_card_cua_toi.dart';
import 'clb_card.dart';

class DanhSachClbCuaToiWidget extends StatelessWidget {
  const DanhSachClbCuaToiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách câu lạc bộ đã đăng ký'),
      ),
      body: ListView.builder(
        itemCount: 14, // Đặt số lượng thẻ cần hiển thị
        itemBuilder: (context, index) {
          return ClubCardCuaToi(backgroundIndex: index);
        },
      ),
    );
  }
}
