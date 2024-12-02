import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/widget/clb_card_cua_toi.dart';

import '../../../controllers/ngoai_khoa/ngoai_khoa_controller.dart';

class DanhSachClbCuaToiWidget extends StatelessWidget {
  const DanhSachClbCuaToiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ngoaiKhoaController= Get.put(NgoaiKhoaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách câu lạc bộ đã đăng ký'),
      ),
      body: FutureBuilder(
        future: ngoaiKhoaController.getEnrolledClubData(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data==null) {
            return const Center(child: Text('Không có dữ liệu.'));
          }
          else{
            final enrolledClubs = snapshot.data!.enrolled;
            return ListView.builder(
              itemCount: enrolledClubs.length, // Đặt số lượng thẻ cần hiển thị
              itemBuilder: (context, index) {
                return ClubCardCuaToi(backgroundIndex: index, enrolledClub: enrolledClubs[index]);
              },
            );
          }
        }
      ),
    );
  }
}
