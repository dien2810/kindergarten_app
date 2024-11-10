import 'package:flutter/material.dart';

class ChiTietSuKienWidget extends StatelessWidget {
  final String title;
  final String time;
  final String description;

  const ChiTietSuKienWidget({Key? key, required this.title, required this.time, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Time: $time'),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
