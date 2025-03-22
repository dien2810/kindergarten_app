import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/ngoai_khoa/screen/teacher_chi_tiet_cau_lac_bo_screen.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/ngoai_khoa/enroll_club_controller.dart';
import '../widget/thanh_vien_widget.dart';

class TeacherDanhSachThanhVienClbScreen extends StatefulWidget {
  final String clubID;

  const TeacherDanhSachThanhVienClbScreen({super.key, required this.clubID});

  @override
  _TeacherDanhSachThanhVienClbScreenState createState() =>
      _TeacherDanhSachThanhVienClbScreenState();
}

class _TeacherDanhSachThanhVienClbScreenState
    extends State<TeacherDanhSachThanhVienClbScreen> {
  final TextEditingController searchController = TextEditingController();
  final EnrolledClubController enrolledController = Get.put(EnrolledClubController());

  @override
  void initState() {
    super.initState();
    enrolledController.fetchMembers(widget.clubID);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tThanhVienCLB),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container(
              //   margin: const EdgeInsets.only(bottom: 16.0),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFF4E9F7),
              //     borderRadius: BorderRadius.circular(18.0),
              //   ),
              //   child: TextField(
              //     controller: searchController,
              //     decoration: const InputDecoration(
              //       contentPadding:
              //       EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              //       suffixIcon: Icon(
              //         Icons.search,
              //         color: Colors.black,
              //       ),
              //       hintText: 'Tìm kiếm thành viên...',
              //       hintStyle: TextStyle(
              //         fontSize: 14.0,
              //         color: Color(0xFF7B7B7B),
              //       ),
              //       border: InputBorder.none,
              //     ),
              //     onChanged: (value) {
              //       // Thực hiện logic tìm kiếm
              //     },
              //   ),
              // ),
              // Dãy button
              const SizedBox(height: 10.0), // Khoảng cách giữa button và danh sách
              // Danh sách học sinh
              Expanded(
                child: Obx(() {
                  if (enrolledController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (enrolledController.members.isEmpty) {
                    return const Center(child: Text('Không có thành viên nào trong câu lạc bộ này.'));
                  }
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      alignment: WrapAlignment.center,
                      children: enrolledController.members.map((member) {
                        print(member.id);
                        return ThanhVienWidget(
                          student: member,
                        );
                      }).toList(),
                    ),
                  );
                }),
              ),
              // Footer với 2 button
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF99D98C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        onPressed: () {
                          // Thêm logic chi tiết câu lạc bộ nếu cần
                          Get.to(()=>TeacherChiTietCauLacBoScreen(
                              clubId: widget.clubID
                          ));
                        },
                        child: const Text(
                          'CHI TIẾT CLB',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0), // Khoảng cách giữa hai button
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF380543),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'QUAY LẠI',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
