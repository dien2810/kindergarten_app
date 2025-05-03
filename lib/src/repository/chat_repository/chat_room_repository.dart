import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/chat/message.dart';
import '../account_repository/account_repository.dart';

class ChatRoomRepository extends GetxController{
  static ChatRoomRepository get instance => Get.find();
  final CollectionReference _chatRoomCollection = FirebaseFirestore.instance.collection('chatRoom');

  // send message
  Future<void> sendMessage(String receiverID, String message) async{
    // get current user info
    final accountRepo = Get.put(AccountRepository());
    final String currentUserID = accountRepo.userId;
    final Timestamp timestamp = Timestamp.now();
    // create a new messasge
    Message newMessage = Message(
        senderID: currentUserID,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp
    );
    // construct chat room ID for the two user (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // sort the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomID = ids.join('_');
    // add new message to db
    await _chatRoomCollection.doc(chatRoomID).collection('messages').add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userID, String otherUserID){
    // construct a chatroomID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _chatRoomCollection
        .doc(chatRoomID)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}