import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/ngoai_khoa/ngoai_khoa_controller.dart';
import '../../../models/club/club_model.dart';
import 'clb_card.dart';

class DanhSachClbWidget extends StatelessWidget {
  const DanhSachClbWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ngoaiKhoaController= Get.put(NgoaiKhoaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách câu lạc bộ - Ngoại khóa'),
      ),
      body: FutureBuilder<List<ClubModel>>(
        future: ngoaiKhoaController.getClubData(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có dữ liệu.'));
          }
          else{
            final clubs = snapshot.data!;
            return ListView.builder(
              itemCount: clubs.length, // Đặt số lượng thẻ cần hiển thị
              itemBuilder: (context, index) {
                return ClubCard(backgroundIndex: index, club: clubs[index]);
              },
            );
          }
        }

      ),
    );
  }
}
