import 'package:flutter/material.dart';

class FaceDetectionButton extends StatelessWidget {
  const FaceDetectionButton(
      {super.key, this.onPressed,
        this.text,
        this.color = const Color(0xFF0F0BDB),
        this.icon = const Icon(
          Icons.add,
          color: Colors.white,
        )});
  final void Function()? onPressed;
  final String? text;
  final Icon icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            icon
          ],
        ),
      ),
    );
  }
}
