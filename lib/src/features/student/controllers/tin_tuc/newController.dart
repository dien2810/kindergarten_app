import 'package:get/get.dart';
import '../../../../repository/new_repository/new_repository.dart';
import '../../models/news/newModel.dart';

class NewsController extends GetxController {
  var allNews = <NewsModel>[].obs;
  var loading = false.obs;

  final NewsRepository _newsRepository = NewsRepository();

  @override
  void onInit() {
    super.onInit();
    fetchAllNews();
  }

  Future<void> fetchAllNews() async {
    try {
      loading.value = true;
      allNews.value = await _newsRepository.getAllNews();
    } catch (e) {
      print("Error fetching all news: $e");
    } finally {
      loading.value = false;
    }
  }

  Future<void> fetchNewsByType(String type) async {
    try {
      loading.value = true;
      allNews.value = await _newsRepository.getNewsByType(type);
    } catch (e) {
      print("Error fetching news by type: $e");
    } finally {
      loading.value = false;
    }
  }
}
