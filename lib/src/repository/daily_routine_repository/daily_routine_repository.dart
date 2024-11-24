import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/daily_routine/daily_routine_model.dart';

class DailyRoutineRepository extends GetxController{
  static DailyRoutineRepository get instance => Get.find();
  final CollectionReference _dailyRoutineCollection = FirebaseFirestore.instance.collection('dailyRoutine');
  // Thêm một document mới vào Firestore
  Future<DailyRoutineModel?> getDailyRoutineById() async {
    final snapshot = await _dailyRoutineCollection.doc('daily_id_1').get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return DailyRoutineModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addDailyRoutine(DailyRoutineModel dailyRoutine) async {
    try {
      await _dailyRoutineCollection.doc(dailyRoutine.id).set(dailyRoutine.toMap());
      print("DailyRoutine added successfully");
    } catch (e) {
      print("Failed to add DailyRoutine: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteDailyRoutine(String dailyRoutineId) async {
    try {
      await _dailyRoutineCollection.doc(dailyRoutineId).delete();
      print("DailyRoutine deleted successfully");
    } catch (e) {
      print("Failed to delete DailyRoutine: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateDailyRoutine(DailyRoutineModel dailyRoutine) async {
    try {
      await _dailyRoutineCollection.doc(dailyRoutine.id).update(dailyRoutine.toMap());
      print("DailyRoutine updated successfully");
    } catch (e) {
      print("Failed to update DailyRoutine: $e");
    }
  }
}