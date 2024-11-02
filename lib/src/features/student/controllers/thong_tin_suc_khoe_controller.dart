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

  // danh sach lich su tiem chung
  var isDetailView = false.obs;
  var selectedVaccine = Rxn<String>();
  var vaccineHistory = <Map<String, dynamic>>[
    {
      'STT': '1',
      'LoaiVaccine': 'vaccine uống',
      'vaccineHistory_id_1_12': {
        'vaccineID': 'vaccine_id_12',
        'doses': [
          {
            'dateAdministered': '05/07/2022',
            'dose': '1.5 ml',
            'site': 'Uống (vaccine uống)',
            'provider': 'Trạm y tế Phường Long Trường - 1341 Nguyễn Duy Trinh, KP Phước Lai, Phường Long Trường, Quận Thủ Đức',
            'sideEffects': 'Không có',
            'nextDoseDue': '05/01/2023',
            'vaccinationProgress': '1/2',
          },
          {
            'dateAdministered': '05/01/2023',
            'dose': '1.5 ml',
            'site': 'Uống (vaccine uống)',
            'provider': 'Trạm y tế Phường Long Trường - 1341 Nguyễn Duy Trinh, KP Phước Lai, Phường Long Trường, Quận Thủ Đức',
            'sideEffects': 'Không có',
            'nextDoseDue': 'Không có',
            'vaccinationProgress': '2/2',
          },
        ],
      },
    },
    {
      'STT': '2',
      'LoaiVaccine': 'vaccine tiêm',
      'vaccineHistory_id_2_14': {
        'vaccineID': 'vaccine_id_14',
        'doses': [
          {
            'dateAdministered': '15/05/2020',
            'dose': '1 ml',
            'site': 'Cánh tay trái',
            'provider': 'Trạm y tế Phường Hiệp Bình Chánh - 76 Nguyễn Đức Cảnh, Phường Hiệp Bình Chánh, Quận Thủ Đức',
            'sideEffects': 'Sưng tại chỗ tiêm',
            'nextDoseDue': '20/06/2020',
            'vaccinationProgress': '1/2',
          },
          {
            'dateAdministered': '20/06/2020',
            'dose': '1 ml',
            'site': 'Cánh tay phải',
            'provider': 'Trạm y tế Phường Hiệp Bình Chánh - 76 Nguyễn Đức Cảnh, Phường Hiệp Bình Chánh, Quận Thủ Đức',
            'sideEffects': 'Không có',
            'nextDoseDue': 'Không có',
            'vaccinationProgress': '2/2',
          },
        ],
      },
    },
  ].obs;
}
