import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GiaDinhCoBenh{khong,co}
enum TruyenNhiem{khong,co}
enum TimMach{khong,co}
enum DaiThaoDuong{khong,co}
enum Lao{khong,co}
enum HenSuyen{khong,co}
class ThongTinSucKhoeController extends GetxController{
  static ThongTinSucKhoeController get instance => Get.find();
  var giaDinhCoBenhStatus = GiaDinhCoBenh.khong.obs;
  var truyenNhiemStatus = TruyenNhiem.khong.obs;
  var timMachStatus = TimMach.khong.obs;
  var daiThaoDuongStatus = DaiThaoDuong.khong.obs;
  var laoStatus = Lao.khong.obs;
  var henSuyenStatus = HenSuyen.khong.obs;
  final benhKhac = TextEditingController();
  final chieuCao = TextEditingController();
  final canNang = TextEditingController();
  final mach = TextEditingController();
  final huyetAp = TextEditingController();
  final chiSoBMI = TextEditingController();
  final theChat = TextEditingController();
  final ghiChu = TextEditingController(text: 'Không có');

  final matPhaiKhongKinh = TextEditingController();
  final matTraiKhongKinh = TextEditingController();
  final matPhaiCoKinh = TextEditingController();
  final matTraiCoKinh = TextEditingController();
  final tinhTrangMat = TextEditingController();
  final tinhTrangRang = TextEditingController();
  final tinhTrangTai = TextEditingController();
  final benhLyKhac = TextEditingController();
  final chanDoanCuaBacSi = TextEditingController();


}