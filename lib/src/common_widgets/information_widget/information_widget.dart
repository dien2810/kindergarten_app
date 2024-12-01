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
      padding: EdgeInsets.all(t10Size),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              maxLines: null,
              value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}