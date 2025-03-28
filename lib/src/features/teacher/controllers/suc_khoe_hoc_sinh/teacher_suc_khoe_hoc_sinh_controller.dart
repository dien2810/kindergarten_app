import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/vaccine/vaccine_information_model.dart';
import 'package:kindergarten_app/src/repository/vaccine_information_repository/vaccine_information_repository.dart';

import '../../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../constants/text_strings.dart';
import '../../../../repository/healthHistory_repository/healthHistory_repository.dart';
import '../../../../repository/health_information_repository/health_information_repository.dart';
import '../../../../repository/medical_record_repository/medical_record_repository.dart';
import '../../../../repository/vaccine_history_reposiroty/vaccine_history_repository.dart';
import '../../../../repository/vaccine_repository/vaccine_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';
import '../../../student/models/health_history/health_history_model.dart';
import '../../../student/models/health_information/health_information_model.dart';
import '../../../student/models/medical_record/medical_record_model.dart';
import '../../../student/models/student/student_model.dart';
import '../../../student/models/vaccine/dose.dart';
import '../../../student/models/vaccine/vaccine_history_model.dart';
import '../../../student/models/vaccine/vaccine_model.dart';

enum GiaDinhCoBenh{khong,co}
enum TruyenNhiem{khong,co}
enum TimMach{khong,co}
enum DaiThaoDuong{khong,co}
enum Lao{khong,co}
enum HenSuyen{khong,co}
class TeacherSucKhoeHocSinhController extends GetxController{
  static TeacherSucKhoeHocSinhController get instance => Get.find();

  final _healthHistoryRepo = Get.put(HealthHistoryRepository());
  final _healthInformationRepo = Get.put(HealthInformationRepository());
  final _medicalRecordRepo = Get.put(MedicalRecordRepository());
  final _vaccineRepo = Get.put(VaccineRepository());
  final _vaccineInfoRepo = Get.put(VaccineInformationRepository());
  final _vaccineHistoryRepo = Get.put(VaccineHistoryRepository());

  late final String _healthHistoryId;
  late final String _healthInformationId;
  late final String _medicalRecordId;
  late StudentModel student;

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
  var vaccineInformationId = '';

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
  var vaccineHistoryId = '';
  var vaccineListByStudent = <Map<String, dynamic>>[].obs;
  var isDetailView = false.obs;
  List<VaccineModel> allVaccines = [];
  List<VaccineHistoryModel> allVaccineHistories = [];
  late int vaccineHistoryIndex;
  Rx<DateTime> ngayTiem = DateTime.now().obs;
  Rx<DateTime> lieuTiemTiepTheo = DateTime.now().obs;
  var selectedVaccine = Rxn<VaccineModel>(); // Rxn cho phép null
  late VaccineInformationModel vaccineInfo;

  Future<void> loadData() async {
    super.onInit();
    final healthHistory = await _healthHistoryRepo.getHealthHistoryDetails(student.id!);
    _healthHistoryId = healthHistory.id!;
    final healthInformation = await _healthInformationRepo.getHealthInformationDetails(student.id!);
    _healthInformationId = healthInformation.id!;
    final medicalRecord = await _medicalRecordRepo.getMedicalRecordDetails(student.id!);
    _medicalRecordId = medicalRecord.id!;
    loadHealthHistoryData(healthHistory);
    loadHealthInformationData(healthInformation);
    loadMedicalRecordData(medicalRecord);
    await buildVaccineHistory();
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
    vaccineInformationId = healthInformation.vaccineInformation;
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

  Future<void> buildVaccineHistory() async {
    try {
      vaccineListByStudent.clear();
      // Bước 1: Lấy thông tin vaccine information theo studentID
      vaccineInfo =
        await _vaccineInfoRepo.getVaccineInformationByStudentID(student.studentProfile.studentID);

      // Bước 2: Lấy tất cả vaccine history và vaccine data
      allVaccineHistories = await _vaccineHistoryRepo.getAllVaccineHistory();
      allVaccines = await _vaccineRepo.getAllVaccines();

      // Chuyển vaccine data thành Map để tra cứu nhanh theo vaccineID
      Map<String, VaccineModel> vaccineDataMap = {
        for (var vaccine in allVaccines) vaccine.id!: vaccine
      };

      // Bước 3: Xây dựng mảng vaccineListByStudent
      for (var historyId in vaccineInfo.vaccineHistory) {
        // Tìm vaccine history tương ứng với historyId
        var matchingHistory = allVaccineHistories.firstWhere(
              (history) => history.id == historyId,
          orElse: () => VaccineHistoryModel(
              vaccineID: '', doses: []), // Trường hợp không tìm thấy
        );

        if (matchingHistory.vaccineID.isNotEmpty) {
          // Lấy thông tin vaccine từ vaccineID
          var vaccine = vaccineDataMap[matchingHistory.vaccineID];
          if (vaccine != null) {
            vaccineListByStudent.add({
              "STT": (vaccineListByStudent.length + 1).toString(),
              "vaccineName": vaccine.vaccineName,
              "vaccineHistoryId": historyId,
              "details": matchingHistory.toJson(), // Chuyển history thành JSON
              "description": vaccine.description
            });
          }
        }
      }
    } catch (e) {
      throw Exception('Error building vaccine history: $e');
    }
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
        studentID: student.id!
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
      vaccineInformation: vaccineInformationId,
      note: ghiChu.text.toString().trim(),
      studentID: student.id!,
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
      studentID: student.id!,
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

  Future<void> addNewVaccine(String vaccineName, String description)async {
    await _vaccineRepo.addVaccine(VaccineModel(vaccineName: vaccineName, description: description));
    await buildVaccineHistory();
  }

  Future<void> addNewDoseForStudent(DateTime ngayTiem, String lieuLuongTiem,
      String vitriTiem, String nhaCungCap, String tacDungPhu,
      DateTime lieuTiemTiepTheo, String tienTrinhTiemChung)async {
    try {
      final historyId = vaccineListByStudent[vaccineHistoryIndex]['vaccineHistoryId'];
      await _vaccineHistoryRepo.addDoseToVaccineHistory(
        historyId,
        Dose(
          dateAdministered: DateFormat('dd-MM-yyyy').format(ngayTiem),
          dose: lieuLuongTiem,
          nextDoseDue: DateFormat('dd-MM-yyyy').format(lieuTiemTiepTheo),
          provider: nhaCungCap,
          sideEffects: tacDungPhu,
          site: vitriTiem,
          vaccinationProgress: tienTrinhTiemChung,
        ),
      );
      await buildVaccineHistory();
    } catch (e) {
      throw Exception('Error adding new dose: $e');
    }
  }
  
  Future<void> addNewVaccineHistory() async {
    if (selectedVaccine.value?.id != null){
      String newVaccineHistoryId = await _vaccineHistoryRepo.addVaccineHistory(VaccineHistoryModel(doses: [], vaccineID: selectedVaccine.value?.id as String));
      vaccineInfo.vaccineHistory.add(newVaccineHistoryId);
      await _vaccineInfoRepo.updateVaccineInformation(vaccineInfo);
      await buildVaccineHistory();
    }
  }
}

