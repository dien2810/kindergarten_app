import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class InformationInputWithIconWidget extends StatelessWidget {
  const InformationInputWithIconWidget({
    super.key,
    required this.color,
    required this.title,
    required this.hintText,
    this.widget, this.textEdittingController, this.initialValue,
    this.onChanged
  });

  final Color color;
  final String title;
  final String hintText;
  final Widget? widget;
  final TextEditingController? textEdittingController;
  final String? initialValue;
  final ValueChanged<String>? onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(t5Size),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18
              ),
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: TextFormField(
              initialValue: initialValue,
              controller: textEdittingController,
              maxLines: null,
              onChanged: onChanged,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Arial'
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  focusColor: Colors.transparent,
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(t20Size)
                  )
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 1,
            child: Align(
                alignment: Alignment.centerRight,
                child: widget
            ),
          ),
        ],
      ),
    );
  }
}