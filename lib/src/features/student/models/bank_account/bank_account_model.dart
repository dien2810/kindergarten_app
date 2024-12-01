import 'bank_account_item.dart';

class BankAccountModel {
  String? id;
  Map<int, BankAccountItem>? accounts;

  // Constructor
  BankAccountModel({this.id, required this.accounts});

  // Factory method to create an instance from a Firestore document map
  factory BankAccountModel.fromMap(Map<String, dynamic> map) {
    return BankAccountModel(
      accounts: map.map((key, value) => MapEntry(
        int.parse(key), // Chuyển key từ String về int
        BankAccountItem.fromMap(value),
      )),
    );
  }

  // Method to convert the instance to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return accounts!.map((key, value) => MapEntry(
      key.toString(), // Chuyển key từ int về String
      value.toMap(),
    ));
  }
}
