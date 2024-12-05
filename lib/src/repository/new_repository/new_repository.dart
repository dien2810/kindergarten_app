import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../features/student/models/news/newModel.dart';

class NewsRepository extends GetxService {
  final CollectionReference _newsCollection = FirebaseFirestore.instance.collection('news');

  Future<List<NewsModel>> getAllNews() async {
    try {
      final snapshot = await _newsCollection.get();
      return snapshot.docs.map((doc) => NewsModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching news: $e");
      return [];
    }
  }

  Future<List<NewsModel>> getNewsByType(String type) async {
    try {
      final snapshot = await _newsCollection.where('type', isEqualTo: type).get();
      return snapshot.docs.map((doc) => NewsModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching news by type: $e");
      return [];
    }
  }
}
