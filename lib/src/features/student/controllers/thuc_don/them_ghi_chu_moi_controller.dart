import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/thuc_don/thuc_don_controller.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/menu_repository/menu_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../models/menu/menu_item.dart';

class ThemGhiChuMoiController extends GetxController{
  static ThemGhiChuMoiController get instance => Get.find();
  final _thucDonRepo = Get.put(MenuRepository());
  final _accountRepo = Get.put(AccountRepository());
  final _thucDonController = Get.put(ThucDonController());
  final noiDungGhiChu = TextEditingController();

  Future<void> themMoiGhiChu(MenuItem menuItem) async {
    try {
      final day = Helper.formatDateToString(_thucDonController.selectedDay.value);
      final menuModel = _thucDonController.menuModel;

      // Tìm kiếm `MenuItem` trong danh sách ngày
      final menuItems = menuModel?.dates[day]!;
      if (menuItems != null){
        final index = menuItems.indexWhere((item) =>
        item.name == menuItem.name && item.meal == menuItem.meal);

        if (index == -1) {
          throw Exception('Không tìm thấy MenuItem trong ngày: $day');
        }

        // Thêm ghi chú vào MenuItem
        menuItems[index].note[_accountRepo.userId] = noiDungGhiChu.text;
        menuModel?.dates[day] = menuItems;
        // print(menuModel?.toMap().toString());
        // Cập nhật lại dữ liệu vào Firestore
        await _thucDonRepo.updateMenu(menuModel!);
        print('Thêm ghi chú thành công!');
        Helper.successSnackBar(title: tDaThemThanhCong, message: 'Thêm ghi chú thành công');
      }

    } catch (e) {
      print('Lỗi khi thêm ghi chú: $e');
      Helper.errorSnackBar(title: 'Lỗi khi thêm ghi chú', message: 'Thêm ghi chú thất bại');
    }
  }
}