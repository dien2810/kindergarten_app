import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DateController extends GetxController {
  var selectedDate = ''.obs;

  Future<void> selectDate(BuildContext context) async {
    selectedDate.value = '';
    DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );
    if (selected != null) {
      selectedDate.value = "${selected.day}/${selected.month}/${selected.year}";
    }
  }
}
