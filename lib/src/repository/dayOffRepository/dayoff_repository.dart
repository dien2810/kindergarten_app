import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../features/student/models/dayoff_model/dayoff_model.dart';

class DayoffRepository extends GetxController{
  static DayoffRepository get instance => Get.find();
  final CollectionReference _dayoffCollection = FirebaseFirestore.instance.collection('dayOff');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<DayoffModel?> getDayOffById() async {
    final snapshot = await _dayoffCollection.doc(_accountRepo.userId).get();

    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      print('Data: $data');
      return DayoffModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addDayoff(DayoffModel dayoff) async {
    try {
      await _dayoffCollection.doc(dayoff.id).set(dayoff.toMap(), SetOptions(merge: true));
      Helper.successSnackBar(title: tDaThemThanhCong, message: "Cập nhật đơn xin nghỉ thành công!");
      print("Dayoff added successfully");
    } catch (e) {
      print("Failed to add Dayoff: $e");
      Helper.successSnackBar(title: "Thất bại", message: "Thêm đơn xin nghỉ thất bại!");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteDayoff(String dayoffId) async {
    try {
      await _dayoffCollection.doc(dayoffId).delete();
      print("Dayoff deleted successfully");
    } catch (e) {
      print("Failed to delete Dayoff: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateDayoff(DayoffModel dayoff) async {
    try {
      await _dayoffCollection.doc(dayoff.id).update(dayoff.toMap());
      print("Dayoff updated successfully");
    } catch (e) {
      print("Failed to update Dayoff: $e");
    }
  }

  Future<List<DayoffModel>> fetchListDayOff(String userId) async {
    try {
      // Truy vấn tài liệu của người dùng từ Firestore
      final snapshot = await _dayoffCollection.doc(userId).get();
      if (!snapshot.exists) {
        // Nếu không có dữ liệu, trả về danh sách rỗng
        return [];
      }
      // Lấy dữ liệu và chuyển thành DayOffModel
      final data = snapshot.data() as Map<String, dynamic>;
      final dayOffModel = DayoffModel.fromMap(data);

      return [dayOffModel];
    } catch (e) {
      print('Lỗi khi truy vấn danh sách ngày nghỉ: $e');
      return [];
    }
  }

}