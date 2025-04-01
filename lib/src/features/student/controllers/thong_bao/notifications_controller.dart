import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/notifications_repository/notifications_repository.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../models/notifications/notifications_model.dart';
import '../../models/teacher/teacher_model.dart';

class NotificationsController extends GetxController{
  static NotificationsController get instance => Get.find();
  final _notificationRepo = Get.put(NotificationsRepository());
  final _accountRepo = Get.put(AccountRepository());
  late NotificationsModel notification;
  late TeacherModel teacher;

  Future<List<NotificationsModel>> getNotificationsListData() async{
    return await _notificationRepo.getNotificationsForStudent(_accountRepo.userId);
  }
}