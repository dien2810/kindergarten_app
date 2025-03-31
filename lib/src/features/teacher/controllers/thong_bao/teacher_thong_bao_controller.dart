import 'package:get/get.dart';

import '../../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../repository/account_repository/account_repository.dart';
import '../../../../repository/notifications_repository/notifications_repository.dart';
import '../../../../repository/teacher_repository/teacher_repository.dart';
import '../../../student/controllers/thong_bao/notifications_controller.dart';
import '../../../student/models/notifications/notifications_model.dart';
import '../../../student/models/teacher/teacher_model.dart';


class TeacherThongBaoController extends GetxController {
  static NotificationsController get instance => Get.find();
  final _notificationRepo = Get.put(NotificationsRepository());
  final _accountRepo = Get.put(AccountRepository());

  final _teacherRepo = Get.put(TeacherRepository());
  var notificationsFuture = Rxn<Future<List<NotificationsModel>>>(); // Future reactive

  late NotificationsModel notification;
  late TeacherModel teacher;

  Future<List<NotificationsModel>> getNotificationsList() async{
    String teacherID = _accountRepo.userId;
    return await _notificationRepo.getNotificationsForTeacher(teacherID);
  }

  void loadNotifications() {
    notificationsFuture.value = getNotificationsCreatedByTeacher();
  }
  Future<List<NotificationsModel>> getNotificationsCreatedByTeacher() async {
    String teacherID = _accountRepo.userId;
    return await _notificationRepo.getNotificationsByTeacherID(teacherID);
  }
  Future<String> getTeacherName(String sentBy) async {
    TeacherModel? teacher= await _teacherRepo.getTeacherByTeacherID(sentBy);
    String teacherName = '${teacher!.firstName} ${teacher.lastName}';
    return teacherName;
  }
  Future<void> deleteNotification(String notificationID) async {
    try {
      await _notificationRepo.deleteNotifications(notificationID);
    } catch (e) {
      throw Exception('Delete Failed: $e');
    }
  }

  Future<void> addNotification(NotificationsModel notification) async {
    try {
      await _notificationRepo.addNotifications(notification);
      loadNotifications();
    } catch (e) {
      print("Error adding notification: $e");
    }
  }

  Future<void> reloadNotifications() async {
    loadNotifications();
  }

  Future<void> addNewNotificationByTeacher(String title, String typeOfNotification, String content, String priority, String recipient)async {
    await _notificationRepo.addNotifications(NotificationsModel(
        allReceivedStatus: 'true',
        dateSent: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        message: content,
        priority: priority,
        recipients: [],
        sentBy: _accountRepo.userId,
        title: title,
        typeOfNotification: typeOfNotification
    ));
  }
}
