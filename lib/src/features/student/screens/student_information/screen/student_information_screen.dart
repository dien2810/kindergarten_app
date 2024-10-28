import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/student_information/widget/student_document_widget.dart'; // Import widget
import 'package:kindergarten_app/src/features/student/controllers/guardian_navigation_menu_controller.dart';
class ThongTinHocSinhScreen extends StatelessWidget {
  const ThongTinHocSinhScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin học sinh"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                    child: const Text('Thông tin học sinh'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Hồ sơ giấy tờ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Student Document Widget
              StudentDocumentWidget(
                hoTen: "Nguyễn Văn A",
                maHocSinh: "student_id_1",
                ngaySinh: "1/1/2020",
                gioiTinh: "Male",
                truong: "Cơ sở 1",
                he: "Chuẩn",
                khoi: "3",
                lop: "Lớp giao tiếp và ngôn ngữ Pooh 01",
              ),
            ],
          ),
        ),
      ),
    //guardian bottom navigation bar widget

    );
  }
}
