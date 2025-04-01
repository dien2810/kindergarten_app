import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/constants/cloud_params.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../../flutter_flow/flutter_flow_util.dart';
import '../../constants/text_strings.dart';
import '../../features/student/models/club/day_of_week.dart';

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
    String formattedDate = "${dateTime.day.toString().padLeft(2, '0')}-"
        "${dateTime.month.toString().padLeft(2, '0')}-"
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
      print(jsonMap);
      return jsonMap['public_id'];
    }
    else{
      return '';
    }
  }

  static String formatDateToString(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0'); // Đảm bảo có 2 chữ số
    final month = dateTime.month.toString().padLeft(2, '0'); // Đảm bảo có 2 chữ số
    final year = dateTime.year.toString();
    return "$day-$month-$year";
  }

  static int calculateDaysDifference(String date1, String date2) {
    try {
      // Định dạng ngày tháng (có thể chỉnh sửa theo định dạng đầu vào)
      final DateFormat formatter = DateFormat('dd-MM-yyyy');

      // Chuyển đổi String sang DateTime
      final DateTime parsedDate1 = formatter.parse(date1);
      final DateTime parsedDate2 = formatter.parse(date2);

      // Tính hiệu ngày
      final Duration difference = parsedDate1.difference(parsedDate2);

      // Trả về số ngày (tuyệt đối nếu không quan tâm thứ tự)
      return difference.inDays.abs();
    } catch (e) {
      print('Lỗi khi xử lý ngày tháng: $e');
      return 0;
    }
  }

  // Hàm chuyển đổi từ English sang tiếng Việt
  static String translateDayToVietnamese(String englishDay) {
    const Map<String, String> dayTranslation = {
      'Monday': 'Thứ hai',
      'Tuesday': 'Thứ ba',
      'Wednesday': 'Thứ tư',
      'Thursday': 'Thứ năm',
      'Friday': 'Thứ sáu',
      'Saturday': 'Thứ bảy',
      'Sunday': 'Chủ nhật',
    };

    return dayTranslation[englishDay] ?? englishDay;
  }

// Hàm chuyển Map<String, DayOfWeek> thành chuỗi
  static String mapDayOfWeekToString(Map<String, DayOfWeek> dayOfWeek) {
    return dayOfWeek.entries.map((entry) {
      final String vietnameseDay = translateDayToVietnamese(entry.key);
      final DayOfWeek day = entry.value;
      return '$vietnameseDay: ${day.startTime} - ${day.endTime}';
    }).join('\n'); // Ghép các chuỗi lại bằng dấu xuống dòng
  }

  // Hàm tải video từ Cloudinary
  static Future<void> downloadVideo(String publicId) async {
    try {
      // Tạo URL video từ publicId
      final videoUrl = 'https://res.cloudinary.com/$tCloudName/video/upload/$publicId.mp4';
      print("Downloading video from: $videoUrl");

      final response = await http.get(Uri.parse(videoUrl));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        // Lưu vào thư viện ảnh/video
        final result = await GallerySaver.saveVideo(filePath);
        if (result == true) {
          print("Download thành công");
          Helper.successSnackBar(title: tVideoHoatDong, message: tDaTaiVideoThanhCong);
        } else {
          throw Exception(tLuuVideoThatBai);
        }
      } else {
        throw Exception('$tTaiVideoThatBai ${response.statusCode}');
      }
    } catch (e) {
      Helper.errorSnackBar(title: tVideoHoatDong, message: '$tLoiKhiTaiVideo: $e');
    }
  }



}