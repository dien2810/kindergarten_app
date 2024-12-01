import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/constants/cloud_params.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Helper extends GetxController{
  static String formatDateTime(DateTime dateTime) {
    const daysOfWeek = [
      "Chủ nhật",
      "Thứ 2",
      "Thứ 3",
      "Thứ 4",
      "Thứ 5",
      "Thứ 6",
      "Thứ 7"
    ];

    // Lấy ngày trong tuần
    String dayOfWeek = daysOfWeek[dateTime.weekday % 7];

    // Định dạng ngày/tháng/năm
    String formattedDate = "${dateTime.day.toString().padLeft(2, '0')}/"
        "${dateTime.month.toString().padLeft(2, '0')}/"
        "${dateTime.year}";

    return "$dayOfWeek - $formattedDate";
  }
  static successSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: EdgeInsets.all(t10Size),
      icon: const Icon(LineAwesomeIcons.check_circle, color: Colors.white),
    );
  }

  static warningSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.black,
      backgroundColor: Colors.yellowAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: EdgeInsets.all(t10Size),
      icon: const Icon(LineAwesomeIcons.check_circle, color: Colors.white),
    );
  }

  static errorSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: EdgeInsets.all(t10Size),
      icon: const Icon(LineAwesomeIcons.check_circle, color: Colors.white),
    );
  }

  static modernSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: EdgeInsets.all(t10Size),
      icon: const Icon(LineAwesomeIcons.check_circle, color: Colors.white),
    );
  }

  static Future<String> uploadImage(XFile? imageFile) async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/$tCloudName/upload');
    final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = tUploadPreset
    ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      return jsonMap['url'];
    }
    else{
      return '';
    }
  }

  static String formatDateToString(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0'); // Đảm bảo có 2 chữ số
    final month = dateTime.month.toString().padLeft(2, '0'); // Đảm bảo có 2 chữ số
    final year = dateTime.year.toString();
    return "$day/$month/$year";
  }

}