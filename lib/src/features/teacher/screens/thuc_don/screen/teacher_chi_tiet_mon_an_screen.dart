import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thuc_don/widget/teacher_chinh_sua_mon_an_bottom_sheet.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class TeacherChiTietMonAnScreen extends StatelessWidget {
  const TeacherChiTietMonAnScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietMonAn),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(t15Size),
                      padding: const EdgeInsets.all(t15Size),
                      height: 900,
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
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F0A50),
                            ),
                          ),
                          const SizedBox(height: t15Size),
                          Card(
                            color: const Color(0xFFBA83DE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(t10Size),
                                    child: Center(
                                      child: Text(
                                        tTenMon,
                                        style: TextStyle(
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
                                        topRight: Radius.circular(15.0), // Bo góc phải trên
                                        bottomRight: Radius.circular(15.0), // Bo góc phải dưới
                                      ),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(tThucDonBuaSang),
                                      ),
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: t15Size),
                          const Text(
                            "Ngày tạo món :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F0A50),
                            ),
                          ),
                          const SizedBox(height: t5Size),
                          SizedBox(
                            width: MediaQuery.of(context).size.width, // Đặt chiều rộng bằng với chiều rộng thiết bị
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E6E6), // Màu nền F0EEEE
                                borderRadius: BorderRadius.circular(5), // Bo góc với bán kính 20
                              ),
                              padding: const EdgeInsets.all(t10Size),
                              child: const Text(
                                "25/11/2024", // Thay bằng dữ liệu ngày gọi món
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),

                          const SizedBox(height: t15Size),
                          const Text(
                            "Thực đơn bữa:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F0A50),
                            ),
                          ),
                          const SizedBox(height: t5Size),
                          SizedBox(
                            width: MediaQuery.of(context).size.width, // Đặt chiều rộng bằng với chiều rộng thiết bị
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E6E6), // Màu nền F0EEEE
                                borderRadius: BorderRadius.circular(5), // Bo góc với bán kính 20
                              ),
                              padding: const EdgeInsets.all(t10Size),
                              child: const Text(
                                "Bữa sáng", // Thay bằng dữ liệu ngày gọi món
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(height: t15Size),
                          const Text(
                            "Thành phần nguyên liệu :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F0A50),
                            ),
                          ),
                          const SizedBox(height: t15Size),
                          SizedBox(
                            width: MediaQuery.of(context).size.width, // Đặt chiều rộng bằng với chiều rộng thiết bị
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E6E6), // Màu nền F0EEEE
                                borderRadius: BorderRadius.circular(5), // Bo góc với bán kính 20
                              ),
                              padding: const EdgeInsets.all(t10Size),
                              child: const Text(
                                "Bánh mì, Rau xà lách, Hành tây, Bơ đậu phộng, Thịt bò, Cà chua, Tiêu, Tương ớt, Trứng gà.", // Thay bằng dữ liệu ngày gọi món
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(height: t15Size),
                          const Text(
                            "Danh sách ghi chú:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F0A50),
                            ),
                          ),
                          const SizedBox(height: t10Size),

                          SizedBox(

                            width: MediaQuery.of(context).size.width, // Đặt chiều rộng bằng với chiều rộng thiết bị
                            child: Container(
                              color: Color(0xFFF0EEEE), // Màu nền F0EEEE
                              padding: const EdgeInsets.all(t10Size),
                              child: ListView.builder(
                                shrinkWrap: true, // Đảm bảo chỉ chiếm không gian cần thiết
                                itemCount: notes.length, // Số lượng ghi chú trong notes
                                itemBuilder: (context, index) {
                                  String studentId = notes.keys.elementAt(index); // Lấy student_id
                                  String noteText = notes[studentId]!; // Lấy nội dung ghi chú
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${index + 1}. $studentId: $noteText", // Hiển thị số thứ tự và nội dung
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(height: t15Size), // Khoảng cách giữa các ghi chú
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Nút footer "Chỉnh sửa"
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Màu nền trắng
                padding: const EdgeInsets.all(t20Size), // Thêm padding cho container (nếu cần)
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9317AE),
                    padding: const EdgeInsets.symmetric(
                      vertical: t10Size,
                      horizontal: t20Size,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return const TeacherChinhSuaMonAnBottomSheet();
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
            )

          ],
        ),
      ),
    );
  }
}
Map<String, String> notes = {
  "Nguyễn Văn A": "Bé thích món ăn này.",
  "Trần Thị B": "Bé bị dị ứng nhẹ với món ăn này.",
  "Phạm Minh C": "Bé ăn rất ngoan.",
  "Nguyễn Thị Hồng Thắm": "Bé ăn rất ngoan nhưng bị dị ứng nhẹ với bơ đậu phộng",

};