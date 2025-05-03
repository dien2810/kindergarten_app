import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../controllers/chat/teacher_chat_controller.dart';
import '../widget/user_title.dart';
import 'chat_page.dart';

class TeacherChatScreen extends StatelessWidget {
  const TeacherChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader1(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    final teacherChatController = Get.put(TeacherChatController());
    return StreamBuilder(
      stream: teacherChatController.getUsersStream(),
      builder: (context, snapshot){
        // error
        if (snapshot.hasError){
          return const Text('Error');
        }
        // loading...
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData as Map<String, dynamic>)).toList()
        );
      }
    );
  }

  // build individual list for user
  Widget _buildUserListItem(Map<String, dynamic> userData){
    // display all user except current user
    final accountRepo = Get.put(AccountRepository());
    if (userData['username'] != accountRepo.userId){
      return UserTitle(
          text: userData['fullName'],
          onTap: (){
            Get.to(()=>ChatPage(
              userData: userData,
            ));
          }
      );
    }
    else{
      return Container();
    }
  }
}
