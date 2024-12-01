import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/absent/absent_date_entry.dart';
import 'package:kindergarten_app/src/repository/absent_repository/absent_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

class ChuyenCanController extends GetxController{
  static ChuyenCanController get instance => Get.find();

  final _absentRepo = Get.put(AbsentRepository());

  Rx<DateTime> selectedDay = DateTime.now().obs;

  Future<AbsentDateEntry?> getAbsentByDateTime(DateTime date) async {
    print('Vo controller');
    final absent = await _absentRepo.getAbsentById();
    final day = Helper.formatDateToString(date);
    print(day);
    return absent?.dates[day];
  }
}