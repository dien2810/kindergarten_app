import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/repository/medicine_repository/medicine_repository.dart';

class DanThuocController extends GetxController{
  static DanThuocController get instance => Get.find();
  final _medicineRepo = Get.put(MedicineRepository());

  Future<List<MedicineModel>> getMedicineData(String studentID) async{
    return await _medicineRepo.allMedicine(studentID);
  }
}