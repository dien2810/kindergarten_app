import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/hoan_phi/hoan_phi_model.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/classes_repository/classes_respository.dart';
import 'package:kindergarten_app/src/repository/refundRepository/refund_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../repository/bank_account_repository/bank_account_repository.dart';
import '../../../../repository/guardian_repository/guardian_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';

class ThemThoiHocHoanPhiController extends GetxController{
  static ThemThoiHocHoanPhiController get instance => Get.find();
  final _refundRepo = Get.put(RefundRepository());
  final _accountRepo = Get.put(AccountRepository());
  final _studentRepo = Get.put(StudentRepository());
  final _guardianRepo = Get.put(GuardianRepository());
  final _classRepo = Get.put(ClassesRepository());
  final _bankAccountRepo = Get.put(BankAccountRepository());


  final formTypeList = [tYeuCauThoiHoc, tHoanPhiCLB, tHoanPhiSach, tHoanPhiBHYT, tHoanPhiDongPhuc];
  final selectedValDropdown = tYeuCauThoiHoc.obs;
  final reason = TextEditingController();
  final truongChuyenDen = TextEditingController();

  var formType = tYeuCauThoiHoc;
  var hoVaTenHocSinh = '';
  var maHocSinh = '';
  var lop = '';
  var hoVaTenPhuHuynh = '';
  var phone = '';
  var address = '';
  var accountNumber = '';
  var chuTaiKhoan = '';
  var bankName = '';
  var chiNhanh = '';
  @override
  Future<void> onInit() async {
    super.onInit();
    final guardian = await _guardianRepo.getGuardianById();
    final student = await _studentRepo.getStudentById();
    final classId = student?.studentProfile.studentClass;
    hoVaTenHocSinh = student!.studentProfile.name;
    maHocSinh = _accountRepo.userId;
    final classInfo = await _classRepo.getClassesById(classId!);
    lop = classInfo!.className;
    hoVaTenPhuHuynh = _accountRepo.fullName;
    phone = guardian!.phoneNumber;
    address = guardian.address;
    final bankAccount = await _bankAccountRepo.getBankAccountById();
    final listBankAccount = bankAccount?.accounts;
    final bankAccountItem = listBankAccount?[0];
    accountNumber = bankAccountItem!.bankAccountNumber;
    chuTaiKhoan = hoVaTenPhuHuynh.toUpperCase();
    bankName = bankAccountItem.bankName;
    chiNhanh = bankAccountItem.branch;
  }

  void reset(){
    reason.text = '';
    truongChuyenDen.text = '';
  }

  Future<void> addRefund() async {
    final refund = ThoiHocHoanPhiModel(
      transferSchoolName: truongChuyenDen.text,
      date: Helper.formatDateToString(DateTime.now()),
      formType: selectedValDropdown.value,
      guardianID: _accountRepo.userId,
      reason: reason.text,
      status: tDaGui,
      studentID: _accountRepo.userId
    );
    await _refundRepo.addRefund(refund);
    Helper.successSnackBar(
      title: 'Thêm thành công',
      message: 'Thêm đơn thôi học và hoàn phí thành công'
    );
  }

}