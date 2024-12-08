import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/authentication/models/account_model.dart';
import 'package:kindergarten_app/src/features/student/models/guardian/guardian_model.dart';
import 'package:kindergarten_app/src/features/student/models/student/student_model.dart';
import 'package:kindergarten_app/src/repository/classes_repository/classes_respository.dart';
import 'package:kindergarten_app/src/repository/guardian_repository/guardian_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';

class TaiKhoanController extends GetxController{
  static TaiKhoanController get instance => Get.find();
  final _accountRepo = Get.put(AccountRepository());
  final TextEditingController passwordController = TextEditingController(); // Mật khẩu mẫu
  final TextEditingController nhapMatKhauCu = TextEditingController();
  final TextEditingController nhapMatKhauMoi = TextEditingController();
  final TextEditingController nhapLaiMatKhauMoi = TextEditingController();
  late AccountModel _accountModel;

  //ThongTinPhuHuynh
  final TextEditingController controllerHoTen = TextEditingController();
  final TextEditingController controllerNgaySinh = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerGioiTinh = TextEditingController();
  final TextEditingController controllerNgheNghiep = TextEditingController();
  final TextEditingController controllerSoDienThoai = TextEditingController();
  final TextEditingController controllerDiaChi = TextEditingController();
  final TextEditingController controllerTonGiao = TextEditingController();
  final TextEditingController controllerDanToc = TextEditingController();
  late String hoTenHocSinh;
  late String maHocSinh;
  late String lop;
  late GuardianModel guardian;
  late StudentModel student;


  Future<AccountModel> getAccountDetails() async{
    _accountModel = await _accountRepo.getAccountDetails(_accountRepo.userId);
    return _accountModel;
  }
  Future<void> getThongTinPhuHuynhPageData() async{
    await getAccountDetails();
    final guardianRepo = Get.put(GuardianRepository());
    final studentRepo = Get.put(StudentRepository());
    final classesRepo = Get.put(ClassesRepository());
    guardian = (await guardianRepo.getGuardianByStudentId(_accountModel.username))!;
    student = (await studentRepo.getStudentByStudentId(_accountModel.username))!;
    controllerHoTen.text = guardian.guardianFullname;
    controllerNgaySinh.text = guardian.dateOfBirth;
    controllerEmail.text = guardian.email;
    controllerGioiTinh.text = guardian.gender;
    controllerNgheNghiep.text = guardian.occupation;
    controllerSoDienThoai.text = guardian.phoneNumber;
    controllerDiaChi.text = guardian.address;
    controllerTonGiao.text = guardian.religion;
    controllerDanToc.text = guardian.ethnic;
    hoTenHocSinh = student.studentProfile.name;
    maHocSinh = student.studentProfile.studentID;
    final classes = (await classesRepo.getClassesById(student.studentProfile.studentClass))!;
    lop = classes.className;
  }

  Future<void> updateThongTinPhuHuynh() async{
    final guardianRepo = Get.put(GuardianRepository());
    final newGuardian = GuardianModel(
      id: guardian.id,
      religion: controllerTonGiao.text,
      studentID: guardian.studentID,
      urlAvatar: guardian.urlAvatar,
      address: controllerDiaChi.text,
      dateOfBirth: controllerNgaySinh.text,
      email: controllerEmail.text,
      emergencyContact: guardian.emergencyContact,
      ethnic: controllerDanToc.text,
      gender: controllerGioiTinh.text,
      guardianFullname: controllerHoTen.text,
      occupation: controllerNgheNghiep.text,
      phoneNumber: controllerSoDienThoai.text,
    );
    await guardianRepo.updateGuardian(newGuardian);
    Helper.successSnackBar(title: 'Thành công', message: 'Cập nhật thông tin phụ huynh thành công');
  }

  Future<void> changePassword() async {
    if (nhapMatKhauCu.text == _accountModel.password && nhapMatKhauMoi.text == nhapLaiMatKhauMoi.text){
      final newAccountModel = AccountModel(
        id: _accountModel.id,
        fullname: _accountModel.fullname,
        username: _accountModel.username,
        phoneNo: _accountModel.phoneNo,
        password: nhapLaiMatKhauMoi.text,
        role: _accountModel.role
      );
      await _accountRepo.updateAccountRecord(newAccountModel);
      nhapMatKhauCu.text = '';
      nhapMatKhauMoi.text = '';
      nhapLaiMatKhauMoi.text = '';
      Helper.successSnackBar(title: 'Đổi thành công', message: 'Đổi mật khẩu thành công');
      Get.back();
    }
    else{
      Helper.warningSnackBar(title: 'Đổi mật khẩu thất bại', message: 'Mật khẩu cũ không đúng hoặc nhập lại mật khẩu mới không hợp lệ');
    }

  }
}