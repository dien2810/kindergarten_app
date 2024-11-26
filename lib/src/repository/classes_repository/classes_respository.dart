import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';
import '../../features/student/models/classes/classes_model.dart';

class ClassesRepository extends GetxController{
  static ClassesRepository get instance => Get.find();
  final CollectionReference _classesCollection = FirebaseFirestore.instance.collection('classes');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<ClassesModel?> getClassesById(String classID) async {
    final snapshot = await _classesCollection.doc(classID).get();

    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      print('Data: $data');
      return ClassesModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addClasses(ClassesModel classes) async {
    try {
      await _classesCollection.doc(classes.id).set(classes.toMap(), SetOptions(merge: true));
      Helper.successSnackBar(title: tDaThemThanhCong, message: "Cập nhật thông tin lớp học thành công!");
      print("Classes added successfully");
    } catch (e) {
      print("Failed to add Classes: $e");
      Helper.successSnackBar(title: "Thất bại", message: "Thêm thông tin lớp học thất bại!");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteClasses(String classesId) async {
    try {
      await _classesCollection.doc(classesId).delete();
      print("Classes deleted successfully");
    } catch (e) {
      print("Failed to delete Classes: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateClasses(ClassesModel classes) async {
    try {
      await _classesCollection.doc(classes.id).update(classes.toMap());
      print("Classes updated successfully");
    } catch (e) {
      print("Failed to update Classes: $e");
    }
  }
}