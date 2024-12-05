import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/cloud_image_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../repository/student_repository/student_repository.dart';
import '../widget/teacher_chinh_sua_mon_an_bottom_sheet.dart';
import '../../../../student/models/menu/menu_item.dart';

class TeacherChiTietMonAnScreen extends StatelessWidget {
  final DateTime date;
  final int index;
  const TeacherChiTietMonAnScreen({
    super.key,
    required this.menuItem,
    required this.date,
    required this.index,
  });
  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    StudentRepository studentRepository = Get.put(StudentRepository());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietMonAn),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: t15Size * 6, // Chừa khoảng trống cho nút footer
                ),
                child: Container(
                  margin: EdgeInsets.all(t15Size),
                  padding: EdgeInsets.all(t15Size),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                    border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tChiTietMonAn,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF03045E),
                        ),
                      ),
                      SizedBox(height: t15Size),
                      Card(
                        color: const Color(0xFFBA83DE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(t10Size),
                                child: Center(
                                  child: Text(
                                    menuItem.name, // Hiển thị tên món ăn
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: t10Size * 12,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                  child: CloudImage(publicId: menuItem.image),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: t15Size),
                      const Text(
                        "Thực đơn bữa:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F0A50),
                        ),
                      ),
                      SizedBox(height: t5Size),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 25, // Đặt chiều cao tối thiểu cho các khung
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8E6E6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(t10Size),
                            child: Text(
                              menuItem.meal, // Hiển thị loại bữa ăn
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: t15Size),
                      const Text(
                        "Thành phần nguyên liệu:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F0A50),
                        ),
                      ),
                      SizedBox(height: t15Size),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E6E6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(t10Size),
                        child: Text(
                          menuItem.ingredients.join(', '), // Hiển thị thành phần nguyên liệu
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: t15Size),
                      const Text(
                        "Danh sách ghi chú:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F0A50),
                        ),
                      ),
                      SizedBox(height: t10Size),
                      Container(
                        color: const Color(0xFFF0EEEE),
                        padding: EdgeInsets.all(t10Size),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: menuItem.note.length,
                          itemBuilder: (context, index) {
                            String studentId = menuItem.note.keys.elementAt(index);
                            String noteText = menuItem.note[studentId]!;

                            return FutureBuilder<String?>(

                              future: studentRepository.getStudentNameById(studentId), // Gọi hàm để lấy tên học sinh
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: t15Size),
                                    child: Text(
                                      "${index + 1}. Đang tải tên học sinh...",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: t15Size),
                                    child: Text(
                                      "${index + 1}. Lỗi khi lấy tên học sinh",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                } else if (snapshot.hasData && snapshot.data != null) {
                                  String studentName = snapshot.data!;
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: t15Size),
                                    child: Text(
                                      "${index + 1}. $studentName: $noteText", // Hiển thị tên học sinh và ghi chú
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: t15Size),
                                    child: Text(
                                      "${index + 1}. Không tìm thấy tên học sinh",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(t20Size),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9317AE),
                    padding: EdgeInsets.symmetric(
                      vertical: t10Size,
                      horizontal: t20Size,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return TeacherChinhSuaMonAnBottomSheet(
                          menuItem: menuItem,
                          date: date,
                          index: index,
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Chỉnh sửa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
