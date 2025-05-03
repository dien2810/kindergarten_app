import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, required this.isCurrentUser});
  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(t10Size),
      margin: EdgeInsets.symmetric(vertical: t5Size, horizontal: t5Size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCurrentUser ? Colors.green : Colors.grey.shade500
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white
        )
      )
    );
  }
}
