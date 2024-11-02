import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_detail.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/repository/medicine_repository/medicine_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../screens/dan_thuoc/them_moi_dan_thuoc/chi_tiet_don_thuoc_input_widget.dart';

class ThemMoiDanThuocController extends GetxController{
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final prescription = TextEditingController();
  final note = TextEditingController();
  final medicineRepo = Get.put(MedicineRepository());
  // Danh sách chứa các widget để nhân bản, sử dụng RxList để có thể lắng nghe thay đổi
  var listThuocWidget = <Widget>[
    const ChiTietDonThuocInputWidget(
      dosage: '',
      name: '',
      time: ''
    )
  ].obs;
  var listChiTietDonThuoc = <MedicineDetail>[
    MedicineDetail(
      dosage: '',
      name: '',
      time: ''
    )
  ];
  void reset(){
    prescription.text = '';
    note.text = '';
    startDate.text = '';
    endDate.text = '';
    listChiTietDonThuoc = [
      MedicineDetail(dosage: '', name: '', time: '')
    ];
    listThuocWidget.value = <Widget>[
      const ChiTietDonThuocInputWidget(
        dosage: '',
        name: '',
        time: ''
      )
    ];
  }
  // Hàm thêm widget mới vào danh sách
  void addCloneableWidget() {
    listChiTietDonThuoc.add(MedicineDetail(
      dosage: '',
      name: '',
      time: ''
    ));
    listThuocWidget.add(ChiTietDonThuocInputWidget(
      index: listThuocWidget.length,
      dosage: '',
      name: '',
      time: ''
    ));
  }
  void removeCloneableWidget() {
    if (listThuocWidget.length >= 2) {
      listThuocWidget.removeLast();
      listChiTietDonThuoc.removeLast();
    }
  }
  Future<void> addMedicine(MedicineModel medicine) async{
    DateTime now = DateTime.now();
    String today = "${now.day}/${now.month}/${now.year}";
    if (compareDates(today, medicine.dates[0]) == 1) { //today sau startDate
      medicine.status = tDangThucHien;
    }
    else {
      medicine.status = tDaGui;
    }
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