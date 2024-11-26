import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/repository/medicine_repository/medicine_repository.dart';

class TeacherDanThuocController extends GetxController{
  static TeacherDanThuocController get instance => Get.find();
  final _medicineRepo = Get.put(MedicineRepository());
  var selectedDay = DateTime.now().obs;
  Future<List<MedicineModel>> getMedicineData(String studentID) async{
    return await _medicineRepo.allMedicine(studentID);
  }
  // Lấy danh sách sự kiện cho ngày cụ thể
  void fetchEventsForDay(DateTime day) {
    selectedDay.value = day;
  }
}