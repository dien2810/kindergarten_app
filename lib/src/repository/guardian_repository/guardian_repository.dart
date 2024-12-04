import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';
import '../../features/student/models/guardian/guardian_model.dart';

class GuardianRepository extends GetxController{
  static GuardianRepository get instance => Get.find();
  final CollectionReference _guardianCollection = FirebaseFirestore.instance.collection('guardian');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<GuardianModel?> getGuardianByStudentId(String studentId) async {
    final snapshot = await _guardianCollection.
    where("studentID", isEqualTo: studentId).limit(1).get();
    if (snapshot.docs.isNotEmpty){
      final data = snapshot.docs.map((e) => GuardianModel.fromSnapShot(e as DocumentSnapshot<Map<String, dynamic>>)).single;
      print('Data: $data');
      return data;
    }
    else{
      return null;
    }
    // Chuyển đổi dữ liệu thành model

  }

  Future<GuardianModel?> getGuardianById() async {
    final snapshot = await _guardianCollection.
    where("studentID", isEqualTo: _accountRepo.userId).limit(1).get();
    if (snapshot.docs.isNotEmpty){
      final data = snapshot.docs.map((e) => GuardianModel.fromSnapShot(e as DocumentSnapshot<Map<String, dynamic>>)).single;
      print('Data: $data');
      return data;
    }
    else{
      return null;
    }
     // Chuyển đổi dữ liệu thành model

  }

  // Thêm một document vào Firestore
  Future<void> addGuardian(GuardianModel guardian) async {
    try {
      await _guardianCollection.doc(guardian.id).set(guardian.toMap(), SetOptions(merge: true));
      Helper.successSnackBar(title: tDaThemThanhCong, message: "Cập nhật thông tin lớp học thành công!");
      print("Guardian added successfully");
    } catch (e) {
      print("Failed to add Guardian: $e");
      Helper.successSnackBar(title: "Thất bại", message: "Thêm thông tin lớp học thất bại!");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteGuardian(String guardianId) async {
    try {
      await _guardianCollection.doc(guardianId).delete();
      print("Guardian deleted successfully");
    } catch (e) {
      print("Failed to delete Guardian: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateGuardian(GuardianModel guardian) async {
    try {
      await _guardianCollection.doc(guardian.id).update(guardian.toMap());
      print("Guardian updated successfully");
    } catch (e) {
      print("Failed to update Guardian: $e");
    }
  }
}