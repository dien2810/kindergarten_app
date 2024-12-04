import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../repository/menu_repository/menu_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';
import '../../../student/models/menu/menu_item.dart';
import '../../../student/models/menu/menu_model.dart';

class TeacherThucDonController extends GetxController {
  static TeacherThucDonController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<MenuModel> menuModel = MenuModel(dates: {}).obs;

  final _menuRepo = Get.put(MenuRepository());

  @override
  void onInit() {
    super.onInit();
    // Tự động load dữ liệu khi controller được khởi tạo
    refreshMenuData(selectedDay.value);
  }

  Future<List<MenuItem>?> getMenuData(DateTime date) async {
    String displayDate = _menuRepo.formatSafeDate(date);
    return await _menuRepo.getMenuItemsByDate(displayDate);
  }

  Future<void> addMenuItem(DateTime date, MenuItem menuItem) async {
    await _menuRepo.addMenuItem(date, menuItem);
    await refreshMenuData(date);
  }

  Future<void> editMenuItem(DateTime date, MenuItem menuItem, int index) async {
    await _menuRepo.editMenuItem(date, menuItem, index);
    await refreshMenuData(date);
  }

  Future<void> refreshMenuData(DateTime date) async {
    final newData = await getMenuData(date);
    menuModel.value = MenuModel(dates: {formatSafeDate(date): newData ?? []});
  }

  String formatSafeDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
