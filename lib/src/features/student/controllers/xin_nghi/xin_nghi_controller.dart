import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/dayoff_model/dayoff_model.dart';
import 'package:kindergarten_app/src/repository/dayOffRepository/dayoff_repository.dart';

class XinNghiController extends GetxController{
  static XinNghiController get instance => Get.find();

  final _xinNghiRepo = Get.put(DayoffRepository());

  Future<DayoffModel?> getXinNghiData() async {
    return await _xinNghiRepo.getDayOffById();
  }

  // void loadXinNghi(){
  //
  // }


}