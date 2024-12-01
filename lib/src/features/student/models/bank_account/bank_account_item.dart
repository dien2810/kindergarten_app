class BankAccountItem {
  String? id;
  String bankAccountNumber;
  String bankName;
  String branch;

  // Constructor
  BankAccountItem({
    this.id,
    required this.bankAccountNumber,
    required this.bankName,
    required this.branch,
  });

  // Factory method to create an instance from a map
  factory BankAccountItem.fromMap(Map<String, dynamic> map) {
    return BankAccountItem(
      bankAccountNumber: map['bankAccountNumber'],
      bankName: map['bankName'],
      branch: map['branch'],
    );
  }

  // Method to convert the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'bankAccountNumber': bankAccountNumber,
      'bankName': bankName,
      'branch': branch,
    };
  }
}
