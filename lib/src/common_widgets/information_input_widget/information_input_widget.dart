import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class InformationInput extends StatelessWidget {
  const InformationInput({
    super.key,
    required this.color,
    required this.title,
    required this.textEditingController,
    this.defaultInput=''
  });

  final Color color;
  final String title;
  final TextEditingController textEditingController;
  final String defaultInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: InputBorder.none,
                        focusColor: Colors.transparent,
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(t40Size)
                        )
                    ),
                  ),
                ),
                SizedBox(width: t5Size),
                Text(
                  defaultInput,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}