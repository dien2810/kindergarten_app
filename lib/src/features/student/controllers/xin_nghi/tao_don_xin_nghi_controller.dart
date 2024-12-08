import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/dayoff_model/dayoff_model.dart';
import 'package:kindergarten_app/src/repository/daily_routine_repository/daily_routine_repository.dart';
import 'package:kindergarten_app/src/repository/dayOffRepository/dayoff_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../models/daily_routine/daily_routine_model.dart';

enum XinNghi{caNgay,theoTiet}

class TaoDonXinNghiController extends GetxController{
  static TaoDonXinNghiController get instance => Get.find();
  final _dailyRoutineRepo = Get.put(DailyRoutineRepository());
  final _dayOffRepo = Get.put(DayoffRepository());
  final _accountRepo = Get.put(AccountRepository());
  Rx<DateTime> selectedDay = DateTime.now().obs;
  String thuNgay = Helper.formatDateTime(DateTime.now());
  // Danh sách các routine ID được chọn
  RxSet<String> selectedRoutines = <String>{}.obs;
  var xinNghiStatus = XinNghi.caNgay.obs;
  final lyDoNghi = TextEditingController(text: '');

  Future<DailyRoutineModel?> getListTietTrongNgay() async {
    final dailyRoutine = await _dailyRoutineRepo.getDailyRoutineById();
    dailyRoutine?.routine.entries.forEach((entry) {
      selectedRoutines.add(entry.key); // Thêm từng entry.key vào selectedRoutines
    });
    // print(selectedRoutines); // Kiểm tra kết quả
    return dailyRoutine;
  }

  void addDayOff() async{
    final day = "${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year}";
    final map = {
      "id": _accountRepo.userId,
      "dates": {
        day: {
          "content": lyDoNghi.text.toString().trim(),
          "period": selectedRoutines.toList(),
          "status": tChoDuyet,
        }
      }
    };
    final dayOff = DayoffModel.fromMap(map);
    await _dayOffRepo.addDayoff(dayOff);
  }

  void changeDay() async{
    final day = "${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year}";
    final xinNghi = await _dayOffRepo.getDayOffById();
    final xinNghiMap = xinNghi?.toMap();
    lyDoNghi.text = tLyDoNghi;
    // Kiểm tra nếu map và dates tồn tại
    if (xinNghiMap!.containsKey("dates") && xinNghiMap["dates"] is Map<String, dynamic>) {
      final dates = xinNghiMap["dates"] as Map<String, dynamic>;
      // Kiểm tra nếu ngày tồn tại trong dates
      if (dates.containsKey(day)) {
        final dayData = dates[day] as Map<String, dynamic>;
        // Truy cập content nếu tồn tại
        lyDoNghi.text = (dayData["content"] as String?)!;
      }
    }

  }
}