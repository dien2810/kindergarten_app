import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../features/student/models/bank_account/bank_account_model.dart';

class BankAccountRepository extends GetxController{
  static BankAccountRepository get instance => Get.find();
  final CollectionReference _bankAccountCollection = FirebaseFirestore.instance.collection('bankAccount');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<BankAccountModel?> getBankAccountById() async {
    final snapshot = await _bankAccountCollection.doc(_accountRepo.userId).get();
    if (snapshot.exists && snapshot.data() != null){
      final data = snapshot.data() as Map<String, dynamic>;
      print('Data: $data');
      return BankAccountModel.fromMap(data);
    }
    else{
      return null;
    }
    // Chuyển đổi dữ liệu thành model

  }

  // Thêm một document vào Firestore
  Future<void> addBankAccount(BankAccountModel bankAccount) async {
    try {
      await _bankAccountCollection.doc(bankAccount.id).set(bankAccount.toMap(), SetOptions(merge: true));
      Helper.successSnackBar(title: tDaThemThanhCong, message: "Cập nhật thông tin lớp học thành công!");
      print("BankAccount added successfully");
    } catch (e) {
      print("Failed to add BankAccount: $e");
      Helper.successSnackBar(title: "Thất bại", message: "Thêm thông tin lớp học thất bại!");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteBankAccount(String bankAccountId) async {
    try {
      await _bankAccountCollection.doc(bankAccountId).delete();
      print("BankAccount deleted successfully");
    } catch (e) {
      print("Failed to delete BankAccount: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateBankAccount(BankAccountModel bankAccount) async {
    try {
      await _bankAccountCollection.doc(bankAccount.id).update(bankAccount.toMap());
      print("BankAccount updated successfully");
    } catch (e) {
      print("Failed to update BankAccount: $e");
    }
  }
}