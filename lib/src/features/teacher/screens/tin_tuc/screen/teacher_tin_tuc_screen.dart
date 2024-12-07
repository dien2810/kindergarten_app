import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../../../constants/sizes.dart';
import '../../../../student/models/news/newModel.dart';
import '../../../../student/screens/homepage/pages/new_detail_screen.dart';
import '../../../controllers/tin_tuc/teacher_tin_tuc_controller.dart';

class TeacherTinTucScreen extends StatefulWidget {
  const TeacherTinTucScreen({super.key});

  @override
  State<TeacherTinTucScreen> createState() => _TeacherTinTucScreenState();
}

class _TeacherTinTucScreenState extends State<TeacherTinTucScreen> {
  final TeacherTinTucController teacherTinTucController =
      Get.put(TeacherTinTucController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      teacherTinTucController.loadMoreNews();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Obx(() {
                if (teacherTinTucController.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return TabBarView(
                  children: [
                    _buildNewsList(teacherTinTucController.allNews, 'Tin tức'),
                    _buildNewsList(
                        teacherTinTucController.allNews
                            .where((news) => news.type == 'tuyển sinh')
                            .toList(),
                        'Tuyển sinh'),
                    _buildNewsList(
                        teacherTinTucController.allNews
                            .where(
                                (news) => news.type == 'chương trình giáo dục')
                            .toList(),
                        'Chương trình giáo dục'),
                    _buildNewsList(
                        teacherTinTucController.allNews
                            .where((news) => news.type == 'giới thiệu trường')
                            .toList(),
                        'Giới thiệu trường'),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList(List<NewsModel> filteredNews, String title) {
    if (filteredNews.isEmpty) {
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
            controller: _scrollController,
            itemCount: filteredNews.length,
            itemBuilder: (context, index) {
              return _buildNewsCard(filteredNews[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(NewsModel news) {
    return InkWell(
      onTap: () {
        Get.to(NewsDetailScreen(news: news));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
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
                    news.title ?? 'Chưa có tiêu đề',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news.createDate ?? 'Ngày không xác định',
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
