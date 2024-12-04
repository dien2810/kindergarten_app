import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../repository/menu_repository/menu_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';
import '../../../student/models/menu/menu_item.dart';
import '../../../student/models/menu/menu_model.dart';

class TeacherThucDonController extends GetxController{
  static TeacherThucDonController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
  late MenuModel? menuModel;

  final _menuRepo = Get.put(MenuRepository());

  Future<List<MenuItem>?> getMenuData(DateTime date) async {
    menuModel =  await _menuRepo.getMenuById();
    final day = Helper.formatDateToString(date);
    return menuModel?.dates[day];
  }
  // Thêm món ăn mới vào menu
  Future<void> addMenuItem({
    required String menuId, // Thêm ID menu để xác định menu
    required String date,
    required String image,
    required List<String> ingredients,
    required String meal,
    required String name,
    required Map<String, String> note,
  }) async {
    try {
      // Tạo MenuItem từ dữ liệu giao diện
      final newItem = MenuItem(
        image: image,
        ingredients: ingredients,
        meal: meal,
        name: name,
        note: note,
      );

      // Gọi repository để thêm mới
      await _menuRepo.addMenuItem(menuId, newItem, date);

      // Thông báo thành công
      Get.snackbar(
        'Success',
        'Menu item added successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Cập nhật lại menu sau khi thêm món ăn
      await getMenuData(selectedDay.value);
    } catch (e) {
      // Thông báo lỗi
      print('Failed to add menu item: $e');
      Get.snackbar(
        'Error',
        'Failed to add menu item. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
