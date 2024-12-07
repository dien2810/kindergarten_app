import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  var isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
  }

  late NotificationsModel notification;
  late TeacherModel teacher;

  Future<List<NotificationsModel>> getNotificationsList() async{
    String  teacherID = await _teacherRepo.getTeacherIDByTeacherID(_accountRepo.userId);
    return await _notificationRepo.getNotificationsForTeacher(teacherID);
  }
  Future<List<NotificationsModel>> getNotificationsCreatedByTeacher() async {
    String  teacherID = await _teacherRepo.getTeacherIDByTeacherID(_accountRepo.userId);
    return await _notificationRepo.getNotificationsByTeacherID(teacherID);
  }
  Future<String> getTeacherName(String sentBy) async {
    TeacherModel? teacher= await _teacherRepo.getTeacherById(sentBy);
    String teacherName =   teacher!.firstName +  ' ' + teacher.lastName;
    return teacherName;
  }
  Future<void> deleteNotification(String notificationID) async {
    try {
      await _notificationRepo.deleteNotifications(notificationID);
    } catch (e) {
      throw Exception('Delete Failed: $e');
    }
  }
  fetchNotificationsCreatedByTeacher() {}

  Future<void> addNotification(NotificationsModel notification) async {
    try {
      isLoading.value = true;
      await _notificationRepo.addNotifications(notification);
      await fetchNotificationsCreatedByTeacher();
      print("Notification added successfully");
    } catch (e) {
      print("Error adding notification: $e");
    } finally {
      isLoading.value = false;
    }
  }



}
