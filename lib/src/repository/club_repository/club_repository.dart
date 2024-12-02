import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/club/club_model.dart';

class ClubRepository extends GetxController{
  static ClubRepository get instance => Get.find();
  final CollectionReference _clubCollection = FirebaseFirestore.instance.collection('club');
  // Thêm một document mới vào Firestore

  Future<List<ClubModel>> allClub() async {
    try{
      final snapshot =
      await _clubCollection.get();
      print('Snapshot: ${snapshot.docs}');
      final refundData = snapshot.docs.map((e) => ClubModel.fromFirestore(e)).toList();

      return refundData;
    } catch(e){
      print("Fail to catch refunds: $e");
      return [];
    }
  }

  Future<ClubModel?> getClubById(String clubId) async {
    final snapshot = await _clubCollection.doc(clubId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return ClubModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addClub(ClubModel club) async {
    try {
      await _clubCollection.doc(club.id).set(club.toMap());
      print("Club added successfully");
    } catch (e) {
      print("Failed to add Club: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteClub(String clubId) async {
    try {
      await _clubCollection.doc(clubId).delete();
      print("Club deleted successfully");
    } catch (e) {
      print("Failed to delete Club: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateClub(ClubModel club) async {
    try {
      await _clubCollection.doc(club.id).update(club.toMap());
      print("Club updated successfully");
    } catch (e) {
      print("Failed to update Club: $e");
    }
  }
}