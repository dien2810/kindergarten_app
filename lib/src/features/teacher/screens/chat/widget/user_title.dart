import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

class UserTitle extends StatelessWidget{
  const UserTitle({super.key, required this.text, required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: t5Size, horizontal: t10Size),
        padding: EdgeInsets.all(t10Size),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            const Icon(Icons.person),
            Text(text)
          ],
        )
      ),

    );
  }
}