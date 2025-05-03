import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatRepository extends GetxController{
  static ChatRepository get instance => Get.find();
  final CollectionReference _chatCollection = FirebaseFirestore.instance.collection('account');

  Stream<List<Object?>> getUsersStream(){
    return _chatCollection.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        // go through each invidual user
        final user = doc.data();
        // return user
        return user;
      }).toList();
    });
  }
}