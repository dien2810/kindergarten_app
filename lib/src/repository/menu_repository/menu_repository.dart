import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../features/student/models/menu/menu_item.dart';
import '../../features/student/models/menu/menu_model.dart';
import '../account_repository/account_repository.dart';

class MenuRepository extends GetxController {
  static MenuRepository get instance => Get.find();
  final CollectionReference _menuCollection = FirebaseFirestore.instance.collection('menu');
  final _accountRepo = Get.put(AccountRepository());

  // Định dạng ngày để đảm bảo an toàn cho Firebase
  String formatSafeDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date); // Chuyển đổi ngày thành định dạng "dd-MM-yyyy"
  }

  // Thêm một document mới vào Firestore
  Future<MenuModel?> getMenuById() async {
    final snapshot = await _menuCollection.doc("menu_id_hechuan").get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return MenuModel.fromMap(data)..id="menu_id_hechuan"; // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Lấy danh sách món ăn theo ngày
  Future<List<MenuItem>?> getMenuItemsByDate(String date) async {
    final snapshot = await _menuCollection.doc("menu_id_hechuan").get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      if (data.containsKey(date)) {
        List<dynamic> items = data[date] as List<dynamic>;
        return items.map((item) => MenuItem.fromMap(item)).toList();
      }
    }
    return null; // Không có món ăn cho ngày này
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

  // Thêm một món ăn mới vào thực đơn
  Future<void> addMenuItem(DateTime date, MenuItem menuItem) async {
    String formattedDate = formatSafeDate(date); // Chuyển đổi ngày thành định dạng "dd-MM-yyyy" để lưu trữ

    DocumentReference docRef = _menuCollection.doc("menu_id_hechuan");
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      if (data.containsKey(formattedDate)) {
        List<dynamic> items = data[formattedDate] as List<dynamic>;
        items.add(menuItem.toMap());
        await docRef.update({formattedDate: items});
      } else {
        await docRef.update({formattedDate: [menuItem.toMap()]});
      }
    } else {
      await docRef.set({
        formattedDate: [menuItem.toMap()]
      });
    }
  }

  // Chỉnh sửa món ăn trong thực đơn
  Future<void> editMenuItem(DateTime date, MenuItem menuItem, int index) async {
    String formattedDate = formatSafeDate(date); // Chuyển đổi ngày thành định dạng "dd-MM-yyyy" để lưu trữ

    DocumentReference docRef = _menuCollection.doc("menu_id_hechuan");
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      if (data.containsKey(formattedDate)) {
        List<dynamic> items = data[formattedDate] as List<dynamic>;
        if (index < items.length) {
          items[index] = menuItem.toMap(); // Cập nhật món ăn tại vị trí được chỉ định
          print('Updating item at index $index: ${menuItem.toMap()}');
          await docRef.update({formattedDate: items});
        } else {
          print("Index out of range");
        }
      } else {
        print("Date not found");
      }
    } else {
      print("Document not found");
    }
  }

}
