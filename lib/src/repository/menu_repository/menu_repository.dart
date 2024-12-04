import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/menu/menu_item.dart';
import '../../features/student/models/menu/menu_model.dart';
import '../../utils/helper_controller/helper_controller.dart';
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

  Future<void> addMenuItem(String menuId, MenuItem menuItem, String dateKey) async {
    try {
      // Lấy tài liệu của menu
      DocumentSnapshot doc = await _menuCollection.doc(menuId).get();

      // Kiểm tra xem tài liệu có tồn tại hay không
      if (doc.exists && doc.data() != null) {
        Map<String, dynamic> menuData = Map<String, dynamic>.from(doc.data() as Map<dynamic, dynamic>);

        // Kiểm tra xem 'dates' có tồn tại hay không
        if (!menuData.containsKey('dates')) {
          menuData['dates'] = {};
        }

        // Chuyển đổi dữ liệu 'dates' thành bản đồ chứa danh sách MenuItem
        Map<String, dynamic> dates = menuData['dates'] as Map<String, dynamic>;

        // Kiểm tra ngày đã có trong danh sách chưa
        if (dates.containsKey(dateKey)) {
          // Nếu ngày đã có, thêm món ăn vào danh sách
          List<MenuItem> existingItems = (dates[dateKey] as List<dynamic>).map((item) => MenuItem.fromMap(item)).toList();
          existingItems.add(menuItem);

          // Cập nhật lại ngày với danh sách món ăn mới
          dates[dateKey] = existingItems.map((item) => item.toMap()).toList();
        } else {
          // Nếu ngày chưa có, tạo mới danh sách với món ăn
          dates[dateKey] = [menuItem.toMap()];
        }

        // Cập nhật lại tài liệu Firestore
        await _menuCollection.doc(menuId).update({'dates': dates});

        print("Món ăn đã được thêm thành công!");
      } else {
        print("Menu ID '$menuId' không tồn tại trong repository");
      }
    } catch (e) {
      print("Thêm món ăn thất bại: $e");
    }
  }
}