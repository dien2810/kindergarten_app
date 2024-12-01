import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/menu_repository/menu_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../models/menu/menu_item.dart';
import '../../models/menu/menu_model.dart';

class ThucDonController extends GetxController{
  static ThucDonController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
  late MenuModel? menuModel;

  final _menuRepo = Get.put(MenuRepository());

  Future<List<MenuItem>?> getMenuData(DateTime date) async {
    menuModel =  await _menuRepo.getMenuById();
    final day = Helper.formatDateToString(date);
    return menuModel?.dates[day];
  }
}