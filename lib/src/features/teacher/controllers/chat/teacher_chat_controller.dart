import 'package:get/get.dart';

import '../../../../repository/chat_repository/chat_repository.dart';

class TeacherChatController extends GetxController{
  final chatController = Get.put(ChatRepository());

  Stream<List<Object?>> getUsersStream(){
    return chatController.getUsersStream();
  }
}