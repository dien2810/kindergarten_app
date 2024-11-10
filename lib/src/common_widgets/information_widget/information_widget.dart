import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
    required this.title, required this.color, required this.value,
  });

  final String title;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(t10Size),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16
            ),
          ),
          Text(
            maxLines: null,
            value,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}