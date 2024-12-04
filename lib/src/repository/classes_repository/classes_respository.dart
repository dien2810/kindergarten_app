import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';
import '../../features/student/models/classes/classes_model.dart';

class ClassesRepository extends GetxController{
  static ClassesRepository get instance => Get.find();
  final CollectionReference _classesCollection = FirebaseFirestore.instance.collection('classes');
  // Thêm một document mới vào Firestore

  Future<ClassesModel?> getClassesByTeacherId(String teacherID) async {
    try {
      // Truy vấn Firestore để tìm document với teacherID
      final querySnapshot = await _classesCollection
          .where('teacherID', isEqualTo: teacherID)
          .limit(1) // Lấy 1 lớp đầu tiên khớp
          .get();
      // Kiểm tra nếu không có tài liệu phù hợp
      if (querySnapshot.docs.isEmpty) {
        return null; // Không tìm thấy
      }
      // Lấy className từ tài liệu đầu tiên
      final Map<String, dynamic> data =
      querySnapshot.docs.first.data() as Map<String, dynamic>;
      return ClassesModel.fromMap(data);
    } catch (e) {
      print('Lỗi khi truy vấn className với teacherID: $e');
      return null; // Trả về null nếu có lỗi
    }
  }

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