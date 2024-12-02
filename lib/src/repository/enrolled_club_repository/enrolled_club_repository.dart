import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/enrolledClub/enrolled_club_model.dart';
import '../account_repository/account_repository.dart';

class EnrolledClubRepository extends GetxController{
  static EnrolledClubRepository get instance => Get.find();
  final CollectionReference _enrolledClubCollection = FirebaseFirestore.instance.collection('enrolledClub');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<EnrolledClubModel?> getEnrolledClubById() async {
    final snapshot = await _enrolledClubCollection.doc(_accountRepo.userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return EnrolledClubModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addEnrolledClub(EnrolledClubModel enrolledClub) async {
    try {
      await _enrolledClubCollection.doc(enrolledClub.id).set(enrolledClub.toMap(), SetOptions(merge: true));
      print("EnrolledClub added successfully");
    } catch (e) {
      print("Failed to add EnrolledClub: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteEnrolledClub(String enrolledClubId) async {
    try {
      await _enrolledClubCollection.doc(enrolledClubId).delete();
      print("EnrolledClub deleted successfully");
    } catch (e) {
      print("Failed to delete EnrolledClub: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateEnrolledClub(EnrolledClubModel enrolledClub) async {
    try {
      await _enrolledClubCollection.doc(enrolledClub.id).update(enrolledClub.toMap());
      print("EnrolledClub updated successfully");
    } catch (e) {
      print("Failed to update EnrolledClub: $e");
    }
  }
}