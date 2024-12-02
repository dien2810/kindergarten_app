import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/notifications/notifications_model.dart';
import '../account_repository/account_repository.dart';

class NotificationsRepository extends GetxController{
  static NotificationsRepository get instance => Get.find();
  final CollectionReference _notificationsCollection = FirebaseFirestore.instance.collection('notifications');
  final _accountRepo = Get.put(AccountRepository());

  Future<List<NotificationsModel>> getNotificationsForStudent(String studentId) async {
    try {
      // Truy vấn các document trong collection 'notifications'
      final snapshot = await _notificationsCollection
          .where('recipients', arrayContains: studentId)
          .get();

      // Chuyển đổi từng document thành NotificationsModel
      final notifications = snapshot.docs.map((doc) {
        return NotificationsModel.fromMap(doc.data() as Map<String,dynamic>);
      }).toList();
      return notifications;
    } catch (e) {
      print('Lỗi khi lấy thông báo: $e');
      return [];
    }
  }

  Future<NotificationsModel?> getNotificationsById(String notificationId) async {
    print(_accountRepo.userId);
    final snapshot = await _notificationsCollection.doc(notificationId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return NotificationsModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addNotifications(NotificationsModel notifications) async {
    try {
      await _notificationsCollection.doc(notifications.id).set(notifications.toMap());
      print("Notifications added successfully");
    } catch (e) {
      print("Failed to add Notifications: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteNotifications(String notificationsId) async {
    try {
      await _notificationsCollection.doc(notificationsId).delete();
      print("Notifications deleted successfully");
    } catch (e) {
      print("Failed to delete Notifications: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateNotifications(NotificationsModel notifications) async {
    try {
      await _notificationsCollection.doc(notifications.id).update(notifications.toMap());
      print("Notifications updated successfully");
    } catch (e) {
      print("Failed to update Notifications: $e");
    }
  }
}