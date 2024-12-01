import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/menu/menu_model.dart';
import '../account_repository/account_repository.dart';

class MenuRepository extends GetxController{
  static MenuRepository get instance => Get.find();
  final CollectionReference _menuCollection = FirebaseFirestore.instance.collection('menu');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<MenuModel?> getMenuById() async {
    print(_accountRepo.userId);
    final snapshot = await _menuCollection.doc("menu_id_hechuan").get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return MenuModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addMenu(MenuModel menu) async {
    try {
      await _menuCollection.doc(menu.id).set(menu.toMap());
      print("Menu added successfully");
    } catch (e) {
      print("Failed to add Menu: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteMenu(String menuId) async {
    try {
      await _menuCollection.doc(menuId).delete();
      print("Menu deleted successfully");
    } catch (e) {
      print("Failed to delete Menu: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateMenu(MenuModel menu) async {
    try {
      await _menuCollection.doc(menu.id).update(menu.toMap());
      print("Menu updated successfully");
    } catch (e) {
      print("Failed to update Menu: $e");
    }
  }
}