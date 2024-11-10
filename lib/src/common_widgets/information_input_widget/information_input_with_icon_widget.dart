import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class InformationInputWithIconWidget extends StatelessWidget {
  const InformationInputWithIconWidget({
    super.key,
    required this.color,
    required this.title,
    required this.hintText,
    this.widget, this.textEdittingController, this.initialValue,
    this.onChanged,
    this.readOnly = false
  });

  final Color color;
  final String title;
  final String hintText;
  final Widget? widget;
  final TextEditingController? textEdittingController;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final bool readOnly;


  @override
  Widget build(BuildContext context) {
    var flex = 0;
    if (widget != null){
      const flex = 1;
    }
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
            flex: 4,
            fit: FlexFit.loose,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
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
              readOnly: readOnly,
            ),
          ),
          const Spacer(),
          Flexible(
            flex: flex,
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