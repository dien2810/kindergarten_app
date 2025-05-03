import 'package:get/get.dart';

import '../../../../repository/chat_repository/chat_repository.dart';

class GuardianChatController extends GetxController{
  final _chatRepo = Get.put(ChatRepository());

  Stream<List<Object?>> getUsersStream(){
    return _chatRepo.getUsersStream();
  }
}