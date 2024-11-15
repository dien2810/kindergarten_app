import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class ChuyenCanFieldWidget extends StatelessWidget {
  const ChuyenCanFieldWidget({
    super.key,
    required this.fillColor,
    required this.field,
    required this.fieldColor,
    required this.value,
    required this.valueColor,
    this.isButton = false,
    this.onPressed = _defaultOnPressed,
  });
  final Color fillColor;
  final String field;
  final Color fieldColor;
  final String value;
  final Color valueColor;
  final bool isButton;
  final VoidCallback onPressed;

  static void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    if (isButton){
      return _buildChuyenCanWithButton();
    } else {
      return _buildChuyenCanWithoutButton();
    }
  }

  Widget _buildChuyenCanWithButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: t5Size),
      height: t50Size,
      color: fillColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            field,
            style: TextStyle(
                color: fieldColor,
                fontSize: 16
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              value,
              style: TextStyle(
                  color: valueColor,
                  fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChuyenCanWithoutButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: t5Size),
      height: t50Size,
      color: fillColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            field,
            style: TextStyle(
                color: fieldColor,
                fontSize: 16
            ),
          ),
          Text(
            value,
            style: TextStyle(
                color: valueColor,
                fontSize: 16
            ),
          )
        ],
      ),
    );
  }
}