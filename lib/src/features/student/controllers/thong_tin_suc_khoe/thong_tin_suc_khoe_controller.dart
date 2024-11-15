import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/health_information/health_information_model.dart';
import 'package:kindergarten_app/src/features/student/models/medical_record/medical_record_model.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/healthHistory_repository/healthHistory_repository.dart';
import 'package:kindergarten_app/src/repository/health_information_repository/health_information_repository.dart';
import 'package:kindergarten_app/src/repository/medical_record_repository/medical_record_repository.dart';

import '../../../../utils/helper_controller/helper_controller.dart';
import '../../models/health_history/health_history_model.dart';

enum GiaDinhCoBenh{khong,co}
enum TruyenNhiem{khong,co}
enum TimMach{khong,co}
enum DaiThaoDuong{khong,co}
enum Lao{khong,co}
enum HenSuyen{khong,co}
class ThongTinSucKhoeController extends GetxController{
  static ThongTinSucKhoeController get instance => Get.find();

  final _accountRepo = Get.put(AccountRepository());
  final _healthHistoryRepo = Get.put(HealthHistoryRepository());
  final _healthInformationRepo = Get.put(HealthInformationRepository());
  final _medicalRecordRepo = Get.put(MedicalRecordRepository());
  late final String _healthHistoryId;
  late final String _healthInformationId;
  late final String _medicalRecordId;

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
  final loiKhuyenCuaBacSi = TextEditingController();

  // danh sach lich su tiem chung
  var vaccineData = {}.obs;
  var vaccinationInformation = {}.obs;
  var vaccineHistory = {}.obs;
  var selectedVaccineHistory = [].obs;
  var selectedVaccine = ''.obs;
  var isDetailView = false.obs;

  @override
  void onInit() async{
    super.onInit();
    final healthHistory = await _healthHistoryRepo.getHealthHistoryDetails(_accountRepo.userId);
    _healthHistoryId = healthHistory.id!;
    final healthInformation = await _healthInformationRepo.getHealthInformationDetails(_accountRepo.userId);
    _healthInformationId = healthInformation.id!;
    final medicalRecord = await _medicalRecordRepo.getMedicalRecordDetails(_accountRepo.userId);
    _medicalRecordId = medicalRecord.id!;
    loadHealthHistoryData(healthHistory);
    loadHealthInformationData(healthInformation);
    loadMedicalRecordData(medicalRecord);
    loadSampleData();
    buildVaccineHistory();
  }

  void loadMedicalRecordData(MedicalRecordModel medicalRecord){
    matPhaiKhongKinh.text = medicalRecord.rightEyeWithoutGlass.toString().trim();
    matTraiKhongKinh.text = medicalRecord.leftEyeWithoutGlass.toString().trim();
    matPhaiCoKinh.text = medicalRecord.rightEye.toString().trim();
    matTraiCoKinh.text = medicalRecord.leftEye.toString().trim();
    tinhTrangMat.text = medicalRecord.eyeConditions;
    tinhTrangRang.text = medicalRecord.dentalConditions;
    tinhTrangTai.text = medicalRecord.earConditions;
    benhLyKhac.text = medicalRecord.otherIllness;
    chanDoanCuaBacSi.text = medicalRecord.doctorDiagnosis;
    loiKhuyenCuaBacSi.text = medicalRecord.doctorAdvice;
  }

  void loadHealthInformationData(HealthInformationModel healthInformation){
    chieuCao.text = healthInformation.height.toString();
    canNang.text = healthInformation.weight.toString();
    mach.text = healthInformation.pulse.toString();
    huyetAp.text = healthInformation.bloodpressure;
    chiSoBMI.text = healthInformation.BMIIndex.toString();
    theChat.text = healthInformation.physicalType;
    ghiChu.text = healthInformation.note;
  }

  void loadHealthHistoryData(HealthHistoryModel healthHistory){
    if (healthHistory.asthma){
      henSuyenStatus.value = HenSuyen.co;
    }
    if (healthHistory.cardiovascular){
      timMachStatus.value = TimMach.co;
    }
    if (healthHistory.diabetes){
      daiThaoDuongStatus.value = DaiThaoDuong.co;
    }
    if (healthHistory.familyHistoryIllness){
      giaDinhCoBenhStatus.value = GiaDinhCoBenh.co;
    }
    if (healthHistory.tuberculosis){
      laoStatus.value = Lao.co;
    }
    if (healthHistory.infectious != tKhongCo){
      truyenNhiemStatus.value = TruyenNhiem.co;
    } else{
      truyenNhiemStatus.value = TruyenNhiem.khong;
    }
    benhKhac.text = healthHistory.note;
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

  void updateHealthHistory() async{
    bool asthma = false, cardiovascular = false, diabetes = false, familyHistoryIllness = false, tuberculosis = false;
    var infectious = tKhongCo;
    if (henSuyenStatus.value == HenSuyen.co){
      asthma = true;
    }
    if (timMachStatus.value == TimMach.co){
      cardiovascular = true;
    }
    if (daiThaoDuongStatus.value == DaiThaoDuong.co){
      diabetes = true;
    }
    if (giaDinhCoBenhStatus.value == GiaDinhCoBenh.co){
      familyHistoryIllness = true;
    }
    if (laoStatus.value == Lao.co){
      tuberculosis = true;
    }
    if (truyenNhiemStatus.value == TruyenNhiem.co){
      infectious = tCo;
    }
    final healthHistory = HealthHistoryModel(
        id: _healthHistoryId,
        asthma: asthma,
        cardiovascular:cardiovascular,
        diabetes: diabetes,
        familyHistoryIllness: familyHistoryIllness,
        tuberculosis: tuberculosis,
        infectious: infectious,
        note: benhKhac.text.toString().trim(),
        studentID: _accountRepo.userId
    );
    try {
      await _healthHistoryRepo.updateHealthHistory(healthHistory);
      Helper.successSnackBar(
        title: 'Successful',
        message: 'Cập nhật thành công!'
      );
    } catch(e){
      Helper.errorSnackBar(
        title: 'Error',
        message: e.toString()
      );
    }

  }

  void updateHealthInformation() async{
    int height, weight, pulse, bmiIndex;
    if (int.tryParse(chieuCao.text) != null && int.parse(chieuCao.text)>0) {
      height = int.parse(chieuCao.text);
    }
    else{
      Helper.warningSnackBar(
        title: 'Invalid number',
        message: 'Chiều cao không hợp lệ',
      );
      return;
    }
    if (int.tryParse(canNang.text) != null && int.parse(canNang.text)>0) {
      weight = int.parse(canNang.text);
    }
    else{
      Helper.warningSnackBar(
        title: 'Invalid number',
        message: 'Cân nặng không hợp lệ',
      );
      return;
    }
    if (int.tryParse(mach.text) != null && int.parse(mach.text)>0) {
      pulse = int.parse(mach.text);
    }
    else{
      Helper.warningSnackBar(
        title: 'Invalid number',
        message: 'Chỉ số mạch không hợp lệ',
      );
      return;
    }
    if (int.tryParse(chiSoBMI.text) != null && int.parse(chiSoBMI.text)>0) {
      bmiIndex = int.parse(chiSoBMI.text);
    }
    else{
      Helper.errorSnackBar(
        title: 'Invalid number',
        message: 'Chỉ số BMI không hợp lệ',
      );
      return;
    }
    final healthInformation = HealthInformationModel(
      id: _healthInformationId,
      height: height,
      weight: weight,
      pulse: pulse,
      bloodpressure: huyetAp.text,
      BMIIndex: bmiIndex,
      physicalType: theChat.text,
      vaccineInformation: '',
      note: ghiChu.text.toString().trim(),
      studentID: _accountRepo.userId,
    );
    try {
      await _healthInformationRepo.updateHealthInformation(healthInformation);
      Helper.successSnackBar(
          title: 'Successful',
          message: 'Cập nhật thành công!'
      );
    } catch(e){
      Helper.errorSnackBar(
          title: 'Error',
          message: e.toString()
      );
    }

  }

  void updateMedicalRecordKhamTab() async{
    int rightEyeWithoutGlass, leftEyeWithoutGlass, rightEye, leftEye;
    if (int.tryParse(matPhaiKhongKinh.text) != null && int.parse(matPhaiKhongKinh.text)>0 && int.parse(matPhaiKhongKinh.text)<=10) {
      rightEyeWithoutGlass = int.parse(matPhaiKhongKinh.text);
    }
    else{
      Helper.warningSnackBar(
        title: 'Invalid number',
        message: 'Giá trị mắt phải không kính không hợp lệ',
      );
      return;
    }
    if (int.tryParse(matTraiKhongKinh.text) != null && int.parse(matTraiKhongKinh.text)>0 && int.parse(matTraiKhongKinh.text)<=10) {
      leftEyeWithoutGlass = int.parse(matTraiKhongKinh.text);
    }
    else{
      Helper.warningSnackBar(
        title: 'Invalid number',
        message: 'Giá trị mắt trái không kính không hợp lệ',
      );
      return;
    }
    if (int.tryParse(matPhaiCoKinh.text) != null && int.parse(matPhaiCoKinh.text)>0 && int.parse(matPhaiCoKinh.text)<=10) {
      rightEye = int.parse(matPhaiCoKinh.text);
    }
    else{
      Helper.warningSnackBar(
        title: 'Invalid number',
        message: 'Giá trị mắt phải có kính không hợp lệ',
      );
      return;
    }
    if (int.tryParse(matTraiCoKinh.text) != null && int.parse(matTraiCoKinh.text)>0 && int.parse(matTraiCoKinh.text)<=10) {
      leftEye = int.parse(matTraiCoKinh.text);
    }
    else{
      Helper.errorSnackBar(
        title: 'Invalid number',
        message: 'Giá trị mắt trái có kính không hợp lệ',
      );
      return;
    }
    final medicalRecord = MedicalRecordModel(
      id: _medicalRecordId,
      rightEyeWithoutGlass: rightEyeWithoutGlass,
      leftEyeWithoutGlass: leftEyeWithoutGlass,
      rightEye: rightEye,
      leftEye: leftEye,
      eyeConditions: tinhTrangMat.text.toString().trim(),
      earConditions: tinhTrangTai.text.toString().trim(),
      dentalConditions: tinhTrangRang.text.toString().trim(),
      otherIllness: benhLyKhac.text.toString().trim(),
      doctorDiagnosis: chanDoanCuaBacSi.text.toString().trim(),
      studentID: _accountRepo.userId,
      doctorAdvice: loiKhuyenCuaBacSi.text.toString().trim(),
    );
    try {
      await _medicalRecordRepo.updateMedicalRecord(medicalRecord);
      Helper.successSnackBar(
          title: 'Successful',
          message: 'Cập nhật thành công!'
      );
    } catch(e){
      Helper.errorSnackBar(
          title: 'Error',
          message: e.toString()
      );
    }

  }
}

