import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/repository/medicine_repository/medicine_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';


class ThemMoiDanThuocController extends GetxController{
  var createDate = DateTime.now().toString();
  final prescription = TextEditingController();
  final note = TextEditingController();
  final hoVaTenPhuHuynhDanThuoc = TextEditingController();
  final lop = TextEditingController();
  final medicineRepo = Get.put(MedicineRepository());
  // Danh sách chứa các widget để nhân bản, sử dụng RxList để có thể lắng nghe thay đổi
  void reset(){
    prescription.text = '';
    note.text = '';
    hoVaTenPhuHuynhDanThuoc.text = 'Nguyễn Văn Bình';
    lop.text = 'Pool 1';
    DateTime now = DateTime.now();
    String formattedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
    createDate = formattedDate;
  }
  // Hàm thêm widget mới vào danh sách

  Future<void> addMedicine(MedicineModel medicine) async{
    await medicineRepo.addMedicine(medicine);
    Helper.successSnackBar(title: 'Đã thêm thành công', message: tDaThemThanhCong);
    Get.offAll(const DanThuocScreen());
  }
  int compareDates(String date1, String date2) {
    // Tách ngày, tháng, năm từ chuỗi ngày và chuyển chúng thành DateTime
    DateTime parsedDate1 = DateTime.parse(
      date1.split('/').reversed.join(),
    );
    DateTime parsedDate2 = DateTime.parse(
      date2.split('/').reversed.join(),
    );
    // So sánh hai DateTime
    if (parsedDate1.isBefore(parsedDate2)) {
      return -1;  // date1 trước date2
    } else if (parsedDate1.isAfter(parsedDate2)) {
      return 1;   // date1 sau date2
    } else {
      return 0;   // date1 và date2 là cùng ngày
    }
  }

}