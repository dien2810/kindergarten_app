import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/refundRepository/refund_repository.dart';

class ThemThoiHocHoanPhiController extends GetxController{
  static ThemThoiHocHoanPhiController get instance => Get.find();
  final _refundRepository = Get.put(RefundRepository());

  final formTypeList = [tYeuCauThoiHoc, tHoanPhiCLB, tHoanPhiSach, tHoanPhiBHYT, tHoanPhiDongPhuc];
  final selectedValDropdown = tYeuCauThoiHoc.obs;
  final reason = TextEditingController();
  final truongChuyenDen = TextEditingController();

  void reset(){
    reason.text = '';
    truongChuyenDen.text = '';
  }

}