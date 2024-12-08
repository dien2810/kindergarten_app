import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergarten_app/src/repository/absent_repository/absent_repository.dart';

import '../../../student/models/absent/absent_model.dart';
import '../../../student/models/student/student_model.dart'; // Import this for date formatting

class TeacherChuyenCanHocSinhController extends GetxController {
  // Store the absent data
  late AbsentModel absentData;

  // Counts for different statuses
  var countWithPermission = 0;
  var countWithoutPermission = 0;
  var countLate = 0;

  Future<AbsentModel> fetchAbsentData(StudentModel student) async{
    final absentRepo = Get.put(AbsentRepository());
    absentData = (await absentRepo.getAbsentByStudentId(student.id!))!;
    return absentData;

    // // Update the absent data
    // absentData.value = jsonData["absent"];
    // countAbsences(); // Call to count the absences
  }

  // Function to count absences
  void countAbsences() {
    countWithPermission = 0;
    countWithoutPermission = 0;
    countLate = 0;
    // Iterate through the data
    absentData.dates.forEach((day, absentDateEntry) {
      switch (absentDateEntry.absentStatus) {
        case 'vắng có phép':
          countWithPermission++;
          break;
        case 'vắng không phép':
          countWithoutPermission++;
          break;
        case 'đến muộn':
          countLate++;
          break;
      }
    });
  }

  // Function to sort the dates :
  // sắp xếp danh sách chuyên cần theo dạng từ ngày gần với hiện tại nhất cho tới xa nhất
  List<MapEntry<String, dynamic>> sortDates(Map<String, dynamic> dates) {
    var sortedDates = dates.entries.toList();

    // Sort by date, converting the string date to DateTime for comparison
    sortedDates.sort((a, b) {
      DateTime dateA = DateFormat('dd-MM-yyyy').parse(a.key);
      DateTime dateB = DateFormat('dd-MM-yyyy').parse(b.key);
      return dateB.compareTo(dateA); // Sort descending
    });

    return sortedDates;
  }
}