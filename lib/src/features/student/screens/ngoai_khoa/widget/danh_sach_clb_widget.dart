import 'package:flutter/material.dart';
import 'clb_card.dart';

class DanhSachClbWidget extends StatelessWidget {
  const DanhSachClbWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách câu lạc bộ - Ngoại khóa'),
      ),
      body: ListView.builder(
        itemCount: 14, // Đặt số lượng thẻ cần hiển thị
        itemBuilder: (context, index) {
          return ClubCard(backgroundIndex: index);
        },
      ),
    );
  }
}
