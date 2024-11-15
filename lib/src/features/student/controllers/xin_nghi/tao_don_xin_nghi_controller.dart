import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum XinNghi{caNgay,theoTiet}

class TaoDonXinNghiController extends GetxController{
  static TaoDonXinNghiController get instance => Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
  var xinNghiStatus = XinNghi.caNgay.obs;
  var donTre = true.obs;
  var tapTheDucBuoiSang = false.obs;
  var anSang = false.obs;
  var hocTap = false.obs;
  var hoatDongTuDo = false.obs;
  var anTrua = false.obs;
  final lyDoNghi = TextEditingController(text: '');
}