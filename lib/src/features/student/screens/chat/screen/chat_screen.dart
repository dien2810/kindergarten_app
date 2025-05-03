import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';

import '../../../../../constants/text_strings.dart';
import '../../../../../repository/account_repository/account_repository.dart';
import '../../../../teacher/screens/chat/widget/user_title.dart';
import '../../../controllers/chat/guardian_chat_controller.dart';
import 'chat_page.dart';

class GuardianChatScreen extends StatelessWidget {
  const GuardianChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GuardianAppBarWithTitleWidget(title: tChat),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    final guardianChatController = Get.put(GuardianChatController());
    return StreamBuilder(
        stream: guardianChatController.getUsersStream(),
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
            Get.to(()=>GuardianChatPage(
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
