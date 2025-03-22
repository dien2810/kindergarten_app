import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/screens/student_information/screen/anh_ho_so_giay_to_screen.dart';
import 'package:kindergarten_app/src/repository/classes_repository/classes_respository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../utils/helper_controller/helper_controller.dart';
import '../../models/student/student_model.dart';
class ThongTinHocSinhController extends GetxController{
  static ThongTinHocSinhController get instance => Get.find();
  final _studentRepo = Get.put(StudentRepository());
  final _classesRepo = Get.put(ClassesRepository());
  final ImagePicker _picker = ImagePicker();
  var imageList = [];

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
  var hasPhoto4x6 = false.obs;
  var hasBirthCertificate = false.obs;
  var hasHouseholdRegistration = false.obs;

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
    anhHocSinh.text = studentDocument.image=='Chưa nộp'?tBamVaoDeNop:studentDocument.image;
    anhGiayKhaiSinh.text = studentDocument.birthCertificate=='Chưa nộp'?tBamVaoDeNop:studentDocument.birthCertificate;
    anhSoHoKhau.text = studentDocument.householdRegistration=='Chưa nộp'?tBamVaoDeNop:studentDocument.householdRegistration;
    hasPhoto4x6.value = studentDocument.image=='Chưa nộp'?false:true;
    hasBirthCertificate.value = studentDocument.birthCertificate=='Chưa nộp'?false:true;
    hasHouseholdRegistration.value = studentDocument.householdRegistration=='Chưa nộp'?false:true;
    imageList = [];
  }

  Future<void> updateThongTinHocSinh() async {
    try{
      if (int.tryParse(khoi.text) == false) {
        Helper.warningSnackBar(title: 'Lỗi dữ liệu', message: 'Dữ liệu nhập vào'
            'không hợp lệ');
        return;
      }
      studentModel.id = maHocSinh.text;
      studentModel.studentProfile.name = hoTen.text;
      studentModel.studentProfile.dateOfBirth = ngaySinh.text;
      studentModel.studentProfile.gender = gioiTinh.text;
      studentModel.studentProfile.school = truong.text;
      studentModel.studentProfile.educationSystem = he.text;
      studentModel.studentProfile.gradeLevel = int.parse(khoi.text);
      //print(studentModel.studentDocument);
      await _studentRepo.updateStudent(studentModel);
      Helper.successSnackBar(title: 'Cập nhật thành công', message: 'Cập nhật thông tin học sinh thành công');
    }catch(e){
      Helper.errorSnackBar(title: 'Cập nhật thất bại', message: 'Cập nhật thông tin cá nhân thất bại');
    }
  }

  Future<void> updateHoSoGiayTo() async{
    try{
      studentModel.id = maHocSinh.text;
      studentModel.studentProfile.fatherFullname = hoCha.text;
      studentModel.studentProfile.motherFullname = hoMe.text;
      studentModel.studentProfile.fatherOccupation = ngheCha.text;
      studentModel.studentProfile.motherOccupation = ngheMe.text;
      studentModel.studentDocument.image = anhHocSinh.text == tBamVaoDeNop ? 'Chưa nộp' : anhHocSinh.text;
      studentModel.studentDocument.birthCertificate = anhGiayKhaiSinh.text == tBamVaoDeNop ? 'Chưa nộp' : anhGiayKhaiSinh.text;
      studentModel.studentDocument.householdRegistration = anhSoHoKhau.text == tBamVaoDeNop ? 'Chưa nộp' : anhSoHoKhau.text;
      await _studentRepo.updateStudent(studentModel);
      for (XFile? image in imageList){
        if (image != null){
          await Helper.uploadImage(image);
          print('Da upload image${image.path}');
        }
      }
      Helper.successSnackBar(title: 'Cập nhật thành công', message: 'Cập nhật thông tin học sinh thành công');
    } catch(e){
      print(e);
      Helper.errorSnackBar(title: 'Cập nhật thất bại', message: 'Cập nhật thông tin cá nhân thất bại');
    }
  }

  Future<void> toggleImage(String type)async {
    List<String> images;
    if (type == 'photo4x6') {
      if (hasPhoto4x6.value == false){
        final image = await pickImage('photo4x6');
        if (image != null){
          anhHocSinh.text = await Helper.uploadImage(image);
          studentModel.studentDocument.image = anhHocSinh.text;
        }
      }
      else{
        images = [anhHocSinh.text];
        Get.to(AnhHoSoGiayToScreen(images: images, type: 'photo4x6'));
      }
    } else{
      if (type == 'birthCertificate') {
        if (hasBirthCertificate.value == false){
          final image = await pickImage('birthCertificate');
          if (image != null){
            anhGiayKhaiSinh.text = await Helper.uploadImage(image);
            studentModel.studentDocument.birthCertificate = anhGiayKhaiSinh.text;
          }
        }
        else{
          images = [anhGiayKhaiSinh.text];
          Get.to(AnhHoSoGiayToScreen(images: images, type: 'birthCertificate'));
        }
      }
      else{
        if (type == 'householdRegistration') {
          if (hasHouseholdRegistration.value == false){
            final image = await pickImage('householdRegistration');
            if (image != null){
              anhSoHoKhau.text = await Helper.uploadImage(image);
              studentModel.studentDocument.householdRegistration = anhSoHoKhau.text;
            }
          }
          else{
            images = [anhSoHoKhau.text];
            Get.to(AnhHoSoGiayToScreen(images: images, type: 'householdRegistration'));
          }
        }
      }
    }
  }

  Future<XFile?> pickImage(String type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageList.add(image);
      if (type == 'photo4x6') {
        hasPhoto4x6.value = true;
        // anhHocSinh.text = image.path;
        anhHocSinh.text = await Helper.uploadImage(image);
      } else if (type == 'birthCertificate') {
        hasBirthCertificate.value = true;
        // anhGiayKhaiSinh.text = image.path;
        anhGiayKhaiSinh.text = await Helper.uploadImage(image);
      } else if (type == 'householdRegistration') {
        hasHouseholdRegistration.value = true;
        // anhSoHoKhau.text = image.path;
        anhSoHoKhau.text = await Helper.uploadImage(image);
      }
    }
    return image;
  }
}