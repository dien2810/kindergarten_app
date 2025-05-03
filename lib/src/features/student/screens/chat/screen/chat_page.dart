import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/controllers/chat/guardian_chat_page_controller.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import '../../../../../constants/text_strings.dart';
import '../../../../teacher/screens/chat/widget/chat_bubble.dart';

class GuardianChatPage extends StatefulWidget {
  const GuardianChatPage({super.key, required this.userData});

  @override
  State<GuardianChatPage> createState() => _GuardianChatPageState();
  final Map<String, dynamic> userData;
}

class _GuardianChatPageState extends State<GuardianChatPage>{
  FocusNode myFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // listen the keyboard to show up
    myFocusNode.addListener((){
      if (myFocusNode.hasFocus){
        // cause a delay for waiting keyboard to show up
        // then the amount of remaining space will be calculated
        // then scroll down
        Future.delayed(
          const Duration(milliseconds: 500),
          () => _scrollDown()
        );
      }
    });

    // wait a bit for listview to be built, then scroll down
    Future.delayed(
      const Duration(milliseconds: 500), () => _scrollDown()
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void _scrollDown(){
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeacherAppBarWithColorAndTitle(hexColor: '3A4A3A', title: widget.userData['fullName']),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: _buildMessageList()
          ),
          _buildUserInput()
          // user imput
        ],
      )
    );
  }

  Widget _buildMessageList(){
    final chatPageController = Get.put(GuardianChatPageController());
    return StreamBuilder(
      stream: chatPageController.getMessages(widget.userData['username']),
      builder: (context, snapshot){
        if (snapshot.hasError){
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // return ListView
        return ListView(
          controller: _scrollController,
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      }
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final accountRepo = Get.put(AccountRepository());
    // isCurrentUser
    bool isCurrentUser = data['senderID'] == accountRepo.userId;

    // assign message to the right if sender is current user, otherwise left
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: ChatBubble(
          isCurrentUser: isCurrentUser,
          message: data['message']
        )
    );
  }

  // build message input
  Widget _buildUserInput(){
    final chatPageController = Get.put(GuardianChatPageController());
    return Padding(
      padding: EdgeInsets.all(t10Size),
      child: Row(
        children: [
          // textfield should take up most of the space
          Expanded(
            child: TextFormField(
              controller: chatPageController.messageController,
              focusNode: myFocusNode,
              decoration: const InputDecoration(
                hintText: tTypeAMessage
              ),
              obscureText: false,
            ),
          ),

          // send button
          Container(
            margin: EdgeInsets.only(left: t3Size),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () async{
                await chatPageController.sendMessage(widget.userData['username']);
                _scrollDown();
              },
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              )
            ),
          )
        ],
      ),
    );
  }
}
