import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onTap, required this.isCheckin});
  final void Function() onTap;
  final bool isCheckin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF0F0BDB),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isCheckin ? tCheckin : tCheckout,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
