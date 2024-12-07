import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/authentication/models/account_model.dart';
import 'package:kindergarten_app/src/features/student/models/teacher/teacher_model.dart';
import 'package:kindergarten_app/src/repository/teacher_repository/teacher_repository.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';

class TeacherTaiKhoanController extends GetxController{
  static TeacherTaiKhoanController get instance => Get.find();
  final _accountRepo = Get.put(AccountRepository());
  final TextEditingController passwordController = TextEditingController(); // Mật khẩu mẫu
  final TextEditingController nhapMatKhauCu = TextEditingController();
  final TextEditingController nhapMatKhauMoi = TextEditingController();
  final TextEditingController nhapLaiMatKhauMoi = TextEditingController();
  late AccountModel _accountModel;

  //ThongTinGiaoVien
  final TextEditingController controllerHo = TextEditingController();
  final TextEditingController controllerTen = TextEditingController();
  final TextEditingController controllerNgaySinh = TextEditingController();
  final TextEditingController controllerGioiTinh = TextEditingController();
  final TextEditingController controllerSoDienThoai = TextEditingController();

  late String hoTenHocSinh;
  late String maHocSinh;
  late String lop;
  late TeacherModel teacher;

  Future<AccountModel> getAccountDetails() async{
    _accountModel = await _accountRepo.getAccountDetails(_accountRepo.userId);
    return _accountModel;  }

  Future<void> getThongTinGiaoVienPageData() async{
    await getAccountDetails();
    final teacherRepo = Get.put(TeacherRepository());
    // final classesRepo = Get.put(ClassesRepository());
    teacher = (await teacherRepo.getTeacherByTeacherId(_accountRepo.userId))!;
    controllerHo.text = teacher.firstName;
    controllerTen.text = teacher.lastName;
    controllerNgaySinh.text = teacher.dateOfBirth;
    controllerGioiTinh.text = teacher.gender;
    controllerSoDienThoai.text = teacher.phone;
    // final classes = (await classesRepo.getClassesById(student.studentProfile.studentClass))!;
    // lop = classes.className;
  }

  Future<void> updateThongTinGiaoVien() async{
    final teacherRepo = Get.put(TeacherRepository());
    final newTeacher = TeacherModel(
      id: teacher.id,
      avatar: teacher.avatar,
      firstName: controllerHo.text,
      lastName: controllerTen.text,
      phone: controllerSoDienThoai.text,
      dateOfBirth: controllerNgaySinh.text,
      teacherID: teacher.teacherID,
      gender: controllerGioiTinh.text,
    );
    await teacherRepo.updateTeacher(newTeacher);
    Helper.successSnackBar(title: 'Thành công', message: 'Cập nhật thông tin giáo viên thành công');
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