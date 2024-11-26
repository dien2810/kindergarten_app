import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/classes_repository/classes_respository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../utils/helper_controller/helper_controller.dart';
import '../../models/student/student_model.dart';
class ThongTinHocSinhController extends GetxController{
  static ThongTinHocSinhController get instance => Get.find();
  final _studentRepo = Get.put(StudentRepository());
  final _classesRepo = Get.put(ClassesRepository());

  final hoTen = TextEditingController();
  final maHocSinh = TextEditingController();
  final ngaySinh = TextEditingController();
  final gioiTinh = TextEditingController();
  final truong = TextEditingController();
  final he = TextEditingController();
  final khoi = TextEditingController();
  final lop = TextEditingController();
  final hoCha = TextEditingController();
  final hoMe = TextEditingController();
  final ngheCha = TextEditingController();
  final ngheMe = TextEditingController();
  final anhHocSinh = TextEditingController();
  final anhGiayKhaiSinh = TextEditingController();
  final anhSoHoKhau = TextEditingController();

  late StudentModel studentModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    studentModel = (await _studentRepo.getStudentById())!;
    final studentProfile = studentModel.studentProfile;
    hoTen.text = studentProfile.name;
    maHocSinh.text = studentProfile.studentID;
    ngaySinh.text = studentProfile.dateOfBirth;
    gioiTinh.text = studentProfile.gender;
    truong.text = studentProfile.school;
    he.text = studentProfile.educationSystem;
    khoi.text = studentProfile.gradeLevel.toString();
    final classesModel = await _classesRepo.getClassesById(studentProfile.studentClass);
    lop.text = classesModel!.className;
    final studentDocument = studentModel.studentDocument;
    hoCha.text = studentProfile.fatherFullname;
    hoMe.text = studentProfile.motherFullname;
    ngheCha.text = studentProfile.fatherOccupation;
    ngheMe.text = studentProfile.motherOccupation;
    anhHocSinh.text = studentDocument.image;
    anhGiayKhaiSinh.text = studentDocument.birthCertificate;
    anhSoHoKhau.text = studentDocument.householdRegistration;
  }

  Future<void> updateThongTinHocSinh() async {
    if (int.tryParse(khoi.text) == false){
      Helper.warningSnackBar(title: 'Lỗi dữ liệu', message: 'Dữ liệu nhập vào'
          'không hợp lệ');
      return;
    }
    studentModel.studentProfile.name = hoTen.text;
    studentModel.studentProfile.dateOfBirth = ngaySinh.text;
    studentModel.studentProfile.gender = gioiTinh.text;
    studentModel.studentProfile.school = truong.text;
    studentModel.studentProfile.educationSystem = he.text;
    studentModel.studentProfile.gradeLevel = khoi.text as int;
    await _studentRepo.updateStudent(studentModel);
  }

  void updateHoSoGiayTo(){

  }
}