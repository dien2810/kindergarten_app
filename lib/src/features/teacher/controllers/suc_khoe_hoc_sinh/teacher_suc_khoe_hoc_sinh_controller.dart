import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GiaDinhCoBenh{khong,co}
enum TruyenNhiem{khong,co}
enum TimMach{khong,co}
enum DaiThaoDuong{khong,co}
enum Lao{khong,co}
enum HenSuyen{khong,co}
class TeacherSucKhoeHocSinhController extends GetxController{
  static TeacherSucKhoeHocSinhController get instance => Get.find();
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
  var vaccineData = {}.obs;
  var vaccinationInformation = {}.obs;
  var vaccineHistory = {}.obs;
  var selectedVaccineHistory = [].obs;
  var selectedVaccine = ''.obs;
  var isDetailView = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSampleData();
    buildVaccineHistory();
  }

  void loadSampleData() {
    // Sample vaccine data
    vaccineData.value = {
      "vaccine_id_1": {
        "vaccineName": "rabies",
        "description": "vaccine phòng bệnh dại "
      },
      "vaccine_id_2": {
        "vaccineName": "pertussis",
        "description": "vaccine phòng bệnh ho gà "
      },
      "vaccine_id_3": {
        "vaccineName": "BCG",
        "description": "vaccine phòng bệnh lao "
      }
    };

    // Sample vaccination information data
    vaccinationInformation.value = {
      "vaccinationInformation_id_10": {
        "studentID": "student_id_10",
        "vaccineHistory": [
          "vaccineHistory_id_1_1",
          "vaccineHistory_id_1_2",
        ]
      }
    };

    // Sample vaccine history data
    vaccineHistory.value = {
      "vaccineHistory_id_1_1": {
        "vaccineID": "vaccine_id_1",
        "doses": [
          {
            "dateAdministered": "21/06/2022",
            "dose": "0.5 ml",
            "site": "Cơ delta (bắp tay) trái",
            "provider": "Phòng khám đa khoa Linh Trung 1 thuộc Bệnh viện Quận Thủ Đức",
            "sideEffects": "Đau nhức tại chỗ tiêm, sốt nhẹ, mệt mỏi.",
            "nextDoseDue": "Không có",
            "vaccinationProgress": "1/"
          }
        ]
      },
      "vaccineHistory_id_1_2": {
        "vaccineID": "vaccine_id_2",
        "doses": [
          {
            "dateAdministered": "16/03/2020",
            "dose": "0.5 ml",
            "site": "đùi trái",
            "provider": "Phòng khám đa khoa Trung tâm Y tế Quận Thủ Đức",
            "sideEffects": "Không có",
            "nextDoseDue": "16/04/2020",
            "vaccinationProgress": "1/4"
          },
          {
            "dateAdministered": "16/04/2020",
            "dose": "0.5 ml",
            "site": "đùi trái",
            "provider": "Phòng khám đa khoa Trung tâm Y tế Quận Thủ Đức",
            "sideEffects": "Sốt, sưng đỏ tại chỗ tiêm, khóc nhiều, biếng ăn, buồn nôn.",
            "nextDoseDue": "16/05/2020",
            "vaccinationProgress": "2/4"
          },
          {
            "dateAdministered": "16/05/2020",
            "dose": "0.5 ml",
            "site": "đùi trái",
            "provider": "Phòng khám đa khoa Trung tâm Y tế Quận Thủ Đức",
            "sideEffects": "Sốt, sưng đỏ tại chỗ tiêm, khóc nhiều, biếng ăn, buồn nôn.",
            "nextDoseDue": "16/07/2021",
            "vaccinationProgress": "3/4"
          },
          {
            "dateAdministered": "16/07/2021",
            "dose": "0.5 ml",
            "site": "đùi trái",
            "provider": "Phòng khám đa khoa Trung tâm Y tế Quận Thủ Đức",
            "sideEffects": "Không có",
            "nextDoseDue": "Không có",
            "vaccinationProgress": "4/4"
          }
        ]
      }
    };
  }

  void buildVaccineHistory() {
    var result = [];
    vaccinationInformation.forEach((key, value) {
      value["vaccineHistory"].forEach((historyId) {
        if (vaccineHistory.containsKey(historyId)) {
          var history = vaccineHistory[historyId];
          var vaccineId = history["vaccineID"];
          var vaccineName = vaccineData[vaccineId]["vaccineName"];
          result.add({
            "STT": (result.length + 1).toString(),
            "LoaiVaccine": vaccineName,
            "vaccineHistoryId": historyId,
            "details": history
          });
        }
      });
    });
    selectedVaccineHistory.value = result;
  }
}

