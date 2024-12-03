import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/tin_tuc/teacher_tin_tuc_controller.dart';

class TeacherTinTucScreen extends StatelessWidget {
  const TeacherTinTucScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherTinTucController = Get.put(TeacherTinTucController());

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader1(),

        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.article), text: "Tin tức"),
                Tab(icon: Icon(Icons.assignment), text: "Tuyển sinh"),
                Tab(icon: Icon(Icons.school), text: "Giáo dục"),
                Tab(icon: Icon(Icons.other_houses), text: "Giới thiệu"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildNewsList(
                      teacherTinTucController.getNewsList(),
                      "Tin tức",
                      teacherTinTucController),
                  _buildNewsList(
                      teacherTinTucController.getTuyenSinhList(),
                      "Tuyển sinh",
                      teacherTinTucController),
                  _buildNewsList(
                      teacherTinTucController.getGiaoDucList(),
                      "Giáo dục",
                      teacherTinTucController),
                  _buildNewsList(
                      teacherTinTucController.getGioiThieuList(),
                      "Giới thiệu trường",
                      teacherTinTucController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList(
      List<Map<String, dynamic>> newsList,
      String title,
      TeacherTinTucController controller,
      ) {
    if (newsList.isEmpty) {
      return const Center(child: Text('Không có tin tức.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: t5Size, horizontal: t5Size),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF7209B7),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final newsItem = newsList[index];
              return _buildNewsCard(newsItem, controller);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(
      Map<String, dynamic> news,
      TeacherTinTucController controller,
      ) {
    String newsId = news['news_id'] ?? '';

    return InkWell(
      onTap: () {
        print('News ID: $newsId');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            // Thay thế bằng ảnh mặc định
            const Image(
              image: AssetImage(tTinTucImageItem1), // Đường dẫn đến ảnh mặc định
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news['title'] ?? 'Chưa có tiêu đề',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news['createDate'] ?? 'Ngày không xác định',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}