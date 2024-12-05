import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/authentication/models/account_model.dart';

class AccountRepository extends GetxController {
  static AccountRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  var userId = '';
  var fullName = '';

  createAccount(AccountModel account) async {
    final isExist = await isAccountExist(account.username);
    if (!isExist){
      await _db
          .collection("account")
          .add(account.toJson())
          .whenComplete(() => const GetSnackBar(
        title: "Success.",
        message: "Your account has been created",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      ))
          .catchError((error, stackTrace) {
        GetSnackBar(
            title: "Error",
            message: "Something went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1));
        print(error.toString());
      });
    } else{
      GetSnackBar(
          title: "Username or Email exists",
          message: "Username or Email exists. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1));
    }

  }
  Future<bool> isAccountExist(String email) async{
    final snapshot =
      await _db.collection("account").where("username", isEqualTo: email)
          .limit(1).get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    return documents.isNotEmpty;
  }
  //Step 2: Fetch a User or All Users
  Future<AccountModel> getAccountDetails(String email) async {
    final snapshot =
      await _db.collection("account").where("username", isEqualTo: email).get();
    final accountData = snapshot.docs.map((e) => AccountModel.fromSnapShot(e)).single;
    return accountData;
  }

  Future<List<AccountModel>> allAccount() async {
    final snapshot =
      await _db.collection("account").get();
    final accountData = snapshot.docs.map((e) => AccountModel.fromSnapShot(e)).toList();
    return accountData;
  }

  Future<void> updateAccountRecord(AccountModel account) async{
    await _db.collection("account").doc(account.id).update(account.toJson());
  }



}
