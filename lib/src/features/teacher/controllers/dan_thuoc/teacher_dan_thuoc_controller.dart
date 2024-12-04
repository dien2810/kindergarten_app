import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/medicine_repository/medicine_repository.dart';

import '../../../../repository/classes_repository/classes_respository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';

class TeacherDanThuocController extends GetxController{
  static TeacherDanThuocController get instance => Get.find();
  final _medicineRepo = Get.put(MedicineRepository());
  final _classesRepo = Get.put(ClassesRepository());

  Future<List<MedicineModel>> getMedicineData() async{
    final accountRepo = Get.put(AccountRepository());
    final classes = await _classesRepo.getClassesByTeacherId(accountRepo.userId);
    return await _medicineRepo.allMedicineByClassName(classes!.className);
  }

  Future<void> updateMedicine(MedicineModel medicine) async{
    try{
      await _medicineRepo.updateMedicine(medicine);
      Helper.successSnackBar(title: 'Cập nhật thành công', message: 'Cập nhật đơn thuốc thành công');
    } catch(e){
      Helper.errorSnackBar(title: 'Cập nhật thất bại', message: 'Cập nhật không thành công!' );
    }
  }
}