import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import this for date formatting

class TeacherChuyenCanHocSinhController extends GetxController {
  // Store the absent data
  var absentData = <String, Map<String, dynamic>>{}.obs;

  // Counts for different statuses
  var countWithPermission = 0.obs;
  var countWithoutPermission = 0.obs;
  var countLate = 0.obs;

  void fetchAbsentData() {
    // Simulate fetching JSON data
    final Map<String, dynamic> jsonData = {
      "absent": {
        "student_id_1": {
          "semesterID": "semester_id_1",
          "amountOfDayOff": 2,
          "dates": {
            "23/09/2024": {
              "period": [
                "routine_id_1",
                "routine_id_2",
                "routine_id_3",
                "routine_id_4",
                "routine_id_5",
                "routine_id_6"
              ],
              "absentTime": "1 ngày",
              "absentStatus": "vắng có phép",
              "checkinImage": "linkanhcheckin",
              "checkoutImage": "linkanhcheckout",
              "checkinTime": "7:00",
              "checkoutTime": "7:30",
              "reason": "Bị ốm"
            },
            "24/09/2024": {
              "period": "none",
              "absentTime": "Không có",
              "absentStatus": "đúng giờ",
              "checkinImage": "linkanhcheckin",
              "checkoutImage": "linkanhcheckout",
              "checkinTime": "7:00",
              "checkoutTime": "17:00",
              "reason": "Không có"
            },
            "25/09/2024": {
              "period": "none",
              "absentTime": "Không có",
              "absentStatus": "vắng không phép",
              "checkinImage": "linkanhcheckin",
              "checkoutImage": "linkanhcheckout",
              "checkinTime": "7:00",
              "checkoutTime": "17:00",
              "reason": "Không có"
            },
            "26/09/2024": {
              "period": "none",
              "absentTime": "Không có",
              "absentStatus": "đến muộn",
              "checkinImage": "linkanhcheckin",
              "checkoutImage": "linkanhcheckout",
              "checkinTime": "7:00",
              "checkoutTime": "17:00",
              "reason": "Không có"
            },
            "27/09/2024": {
              "period": "none",
              "absentTime": "Không có",
              "absentStatus": "đến muộn",
              "checkinImage": "linkanhcheckin",
              "checkoutImage": "linkanhcheckout",
              "checkinTime": "7:00",
              "checkoutTime": "17:00",
              "reason": "Không có"
            },
            "28/09/2024": {
              "period": "none",
              "absentTime": "Không có",
              "absentStatus": "đến muộn",
              "checkinImage": "linkanhcheckin",
              "checkoutImage": "linkanhcheckout",
              "checkinTime": "7:00",
              "checkoutTime": "17:00",
              "reason": "Không có"
            },
          },
        },
      },
    };

    // Update the absent data
    absentData.value = jsonData["absent"];
    countAbsences(); // Call to count the absences
  }

  // Function to count absences
  void countAbsences() {
    countWithPermission.value = 0;
    countWithoutPermission.value = 0;
    countLate.value = 0;

    // Iterate through the data
    absentData.forEach((studentId, studentInfo) {
      var dates = studentInfo['dates'] as Map<String, dynamic>;
      dates.forEach((date, details) {
        switch (details['absentStatus']) {
          case 'vắng có phép':
            countWithPermission.value++;
            break;
          case 'vắng không phép':
            countWithoutPermission.value++;
            break;
          case 'đến muộn':
            countLate.value++;
            break;
        }
      });
    });
  }

  // Function to sort the dates :
  // sắp xếp danh sách chuyên cần theo dạng từ ngày gần với hiện tại nhất cho tới xa nhất
  List<MapEntry<String, dynamic>> sortDates(Map<String, dynamic> dates) {
    var sortedDates = dates.entries.toList();

    // Sort by date, converting the string date to DateTime for comparison
    sortedDates.sort((a, b) {
      DateTime dateA = DateFormat('dd/MM/yyyy').parse(a.key);
      DateTime dateB = DateFormat('dd/MM/yyyy').parse(b.key);
      return dateB.compareTo(dateA); // Sort descending
    });

    return sortedDates;
  }
}