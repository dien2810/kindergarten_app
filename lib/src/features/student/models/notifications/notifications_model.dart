class NotificationsModel {
  String? id;
  String allReceivedStatus;
  String dateSent;
  String message;
  String priority;
  List<String> recipients;
  String sentBy;
  String title;
  String typeOfNotification;

  // Constructor
  NotificationsModel({
    this.id,
    required this.allReceivedStatus,
    required this.dateSent,
    required this.message,
    required this.priority,
    required this.recipients,
    required this.sentBy,
    required this.title,
    required this.typeOfNotification,
  });

  // Factory method to create an instance from a Firestore document map
  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      allReceivedStatus: map['allReceivedStatus'],
      dateSent: map['date_sent'],
      message: map['message'],
      priority: map['priority'],
      recipients: List<String>.from(map['recipients'] ?? []),
      sentBy: map['sent_by'],
      title: map['title'],
      typeOfNotification: map['typeOfNotification'],
    );
  }

  // Method to convert the instance to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'allReceivedStatus': allReceivedStatus,
      'date_sent': dateSent,
      'message': message,
      'priority': priority,
      'recipients': recipients,
      'sent_by': sentBy,
      'title': title,
      'typeOfNotification': typeOfNotification,
    };
  }
}
