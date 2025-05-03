import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/chat_repository/chat_room_repository.dart';

class GuardianChatPageController extends GetxController{
  final _chatRoomRepo = Get.put(ChatRoomRepository());

  final TextEditingController messageController = TextEditingController();

  Future<void> sendMessage(String receiverID) async{
    if (messageController.text.isNotEmpty){
      await _chatRoomRepo.sendMessage(receiverID, messageController.text);
      messageController.clear();
    }
  }

  Stream<QuerySnapshot> getMessages(String otherUserID) {
    final accountRepo = Get.put(AccountRepository());
    final userID = accountRepo.userId;
    return _chatRoomRepo.getMessages(userID, otherUserID);
  }


}