import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/flutter_flow/flutter_flow_util.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../controllers/tin_tuc/newController.dart';
import '../../../models/news/newModel.dart';
import '../../student_information/screen/student_information_screen.dart';
import '../components/TabBar/tab_bar_widget.dart';
import 'homepage_news_model.dart';
import 'new_detail_screen.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with TickerProviderStateMixin {
  late HomePageModel _model;
  late TabController _tabController;
  final NewsController newsController = Get.put(NewsController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    _tabController = TabController(length: 4, vsync: this); // Khởi tạo _tabController
  }

  @override
  void dispose() {
    _model.dispose();
    _tabController.dispose(); // Hủy bỏ _tabController khi không sử dụng
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _accountRepo = Get.put(AccountRepository());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        actions: const [],
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      'assets/images/homepage_images/Vector.png',
                      width: t100Size * 4.2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.84, 0.14),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/homepage_images/Group_25.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.06, -0.24),
                    child: Text(
                      _accountRepo.fullName,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        color: const Color(0xFFCAF0F8),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.04, 0.12),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const ThongTinHocSinhScreen());
                      },
                      child: Text(
                        'Thông tin học sinh',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: const Color(0xFFCAF0F8),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.55, 0.16),
                    child: FlutterFlowIconButton(
                      borderRadius: 8,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 40,
                      ),
                      onPressed: () {
                        Get.to(const ThongTinHocSinhScreen());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1.5,
                      color: Color(0xFF838B8F),
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                      labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                      unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      indicatorWeight: 2.5,
                      tabs: const [
                        Tab(icon: FaIcon(FontAwesomeIcons.solidNewspaper, color: Color(0xFF0B2384)), text: 'Tin tức'),
                        Tab(icon: FaIcon(FontAwesomeIcons.book, color: Color(0xFF0B2384)), text: 'Tuyển sinh'),
                        Tab(icon: FaIcon(FontAwesomeIcons.graduationCap, color: Color(0xFF0B2384)), text: 'Giáo dục'),
                        Tab(icon: Icon(Icons.account_balance_rounded, color: Color(0xFF0B2384)), text: 'Giới thiệu'),
                      ],
                    ),
                    Expanded(
                      child: Obx(() {
                        if (newsController.loading.value) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return TabBarView(
                          controller: _tabController,
                          children: [
                            buildNewsListView(newsController.allNews), // Hiển thị tất cả tin tức
                            buildNewsListView(newsController.allNews.where((news) => news.type == 'tuyển sinh').toList()),
                            buildNewsListView(newsController.allNews.where((news) => news.type == 'chương trình giáo dục').toList()),
                            buildNewsListView(newsController.allNews.where((news) => news.type == 'giới thiệu trường').toList()),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng ListView hiển thị danh sách tin tức
  Widget buildNewsListView(List<NewsModel> filteredNews) {
    return ListView.builder(
      itemCount: filteredNews.length,
      itemBuilder: (context, index) {
        final news = filteredNews[index];
        return ListTile(
          title: Text(news.title),
          subtitle: Text(news.createDate),
          onTap: () {
            // Thêm hành động khi người dùng nhấn vào một mục tin tức
            Get.to( NewsDetailScreen(news: news,));
          },
        );
      },
    );
  }
}
