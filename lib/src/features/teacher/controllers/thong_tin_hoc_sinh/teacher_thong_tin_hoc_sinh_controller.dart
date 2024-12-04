import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/features/student/models/guardian/guardian_model.dart';
import 'package:kindergarten_app/src/repository/guardian_repository/guardian_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../utils/helper_controller/helper_controller.dart';
import '../../../student/models/student/student_model.dart';
import '../../../student/screens/hoat_dong_su_kien/screen/chi_tiet_hinh_anh_hoat_dong_screen.dart';

class TeacherThongTinHocSinhController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final imageList = [];

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
  final soDienThoai= TextEditingController();
  final email = TextEditingController();
  final diaChi = TextEditingController();
  final anhHocSinh = TextEditingController();
  final anhGiayKhaiSinh = TextEditingController();
  final anhSoHoKhau = TextEditingController();

  var hasPhoto4x6 = false.obs;
  var hasBirthCertificate = false.obs;
  var hasHouseholdRegistration = false.obs;

  late StudentModel studentModel;
  late GuardianModel guardianModel;

  Future<void> loadStudentInfo() async {
    final studentRepo = Get.put(StudentRepository());
    final guardianRepo = Get.put(GuardianRepository());
    studentModel = (await studentRepo.getStudentByStudentId(studentModel.studentProfile.studentID))!;
    guardianModel = (await guardianRepo.getGuardianByStudentId(studentModel.studentProfile.studentID))!;
    hoTen.text = studentModel.studentProfile.name;
    maHocSinh.text = studentModel.studentProfile.studentID;
    ngaySinh.text = studentModel.studentProfile.dateOfBirth;
    gioiTinh.text = studentModel.studentProfile.gender;
    truong.text = studentModel.studentProfile.school;
    he.text = studentModel.studentProfile.educationSystem;
    khoi.text = studentModel.studentProfile.gradeLevel.toString();
    lop.text = studentModel.studentProfile.studentClass;

    hoCha.text = studentModel.studentProfile.fatherFullname;
    hoMe.text = studentModel.studentProfile.motherFullname;
    ngheCha.text = studentModel.studentProfile.fatherOccupation;
    ngheMe.text = studentModel.studentProfile.motherOccupation;
    soDienThoai.text = guardianModel.phoneNumber;
    email.text = guardianModel.email;
    diaChi.text = guardianModel.address;
    anhHocSinh.text = studentModel.studentDocument.image;
    if (anhHocSinh.text != 'Chưa nộp'){
      hasPhoto4x6.value = true;
    }
    anhGiayKhaiSinh.text = studentModel.studentDocument.birthCertificate;
    if (anhGiayKhaiSinh.text != 'Chưa nộp'){
      hasBirthCertificate.value = true;
    }
    anhSoHoKhau.text = studentModel.studentDocument.householdRegistration;
    if (anhSoHoKhau.text != 'Chưa nộp'){
      hasHouseholdRegistration.value = true;
    }
  }

  Future<GuardianModel?> getGuardianData(String studentId) async{
    final guardianRepo = Get.put(GuardianRepository());
    return await guardianRepo.getGuardianByStudentId(studentId);
  }

  Future<void> updateStudentInfo() async{
    final studentRepo = Get.put(StudentRepository());
    final guardianRepo = Get.put(GuardianRepository());
    await studentRepo.updateStudent(studentModel);
    await guardianRepo.updateGuardian(guardianModel);
    Helper.successSnackBar(title: 'Cập nhật thành công', message: 'Cập nhật thông tin học sinh thành công');
  }

  Future<void> toggleImage(String type)async {
    List<String> images;
    if (type == 'photo4x6') {
      if (hasPhoto4x6.value == false){
        final image = await pickImage('photo4x6');
        if (image != null){
          anhHocSinh.text = await Helper.uploadImage(image);
        }
      }
      else{
        images = [anhHocSinh.text];
        Get.to(HinhAnhScreen(images: images));
      }
    } else{
      if (type == 'birthCertificate') {
        if (hasBirthCertificate.value == false){
          final image = await pickImage('birthCertificate');
          if (image != null){
            anhGiayKhaiSinh.text = await Helper.uploadImage(image);
          }
        }
        else{
          images = [anhGiayKhaiSinh.text];
          Get.to(HinhAnhScreen(images: images));
        }
      }
      else{
        if (type == 'householdRegistration') {
          if (hasHouseholdRegistration.value == false){
            final image = await pickImage('householdRegistration');
            if (image != null){
              anhSoHoKhau.text = await Helper.uploadImage(image);
            }
          }
          else{
            images = [anhSoHoKhau.text];
            Get.to(HinhAnhScreen(images: images));
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


class StudentRecord {
  String hoTenCha;
  String hoTenMe;
  String ngheNghiepCuaCha;
  String ngheNghiepCuaMe;
  String soDienThoai;
  String diaChiEmail;
  String diaChiThuongTru;

  StudentRecord({
    required this.hoTenCha,
    required this.hoTenMe,
    required this.ngheNghiepCuaCha,
    required this.ngheNghiepCuaMe,
    required this.soDienThoai,
    required this.diaChiEmail,
    required this.diaChiThuongTru,
  });
}
StudentRecord record = StudentRecord(
  hoTenCha: "Nguyễn Văn A",
  hoTenMe: "Nguyễn Thị B",
  ngheNghiepCuaCha: "Kỹ sư",
  ngheNghiepCuaMe: "Giáo viên",
  soDienThoai: "0123456789",
  diaChiEmail: "email@example.com ",
  diaChiThuongTru: "123 Đường ABC",
);
class StudentInfo {
  String hoTen;
  String maHocSinh;
  String ngaySinh;
  String gioiTinh;
  String truong;
  String he;
  String khoi;
  String lop;

  StudentInfo({
    required this.hoTen,
    required this.maHocSinh,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.truong,
    required this.he,
    required this.khoi,
    required this.lop,
  });
}
StudentInfo student = StudentInfo(
  hoTen: "Nguyễn Văn An",
  maHocSinh: "HS001",
  ngaySinh: "01/01/2010",
  gioiTinh: "Nam",
  truong: "Trường Tiểu Học ABC",
  he: "Chương trình chính quy ",
  khoi: "Khối 5",
  lop: "Lớp 5A",
);