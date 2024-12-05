import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/student/models/club/club_model.dart';


class ClubTeacherRepository {
  static Future<List<ClubModel>> getClubsBySemesterAndTeacher(String semesterID, String teacherID) async {
    try {
      print("Fetching clubs for semesterID: $semesterID and teacherID: $teacherID");
      QuerySnapshot clubSnapshot = await FirebaseFirestore.instance
          .collection('club')
          .where('semesterID', isEqualTo: semesterID)
          .where('teacherID', isEqualTo: teacherID)
          .get();

      if (clubSnapshot.docs.isEmpty) {
        print("No clubs found for semesterID: $semesterID and teacherID: $teacherID");
      } else {
        print("Found ${clubSnapshot.docs.length} clubs for semesterID: $semesterID and teacherID: $teacherID");
      }

      List<ClubModel> clubs = [];
      for (var doc in clubSnapshot.docs) {
        print("Processing club with ID: ${doc.id}");
        ClubModel club = ClubModel.fromFirestore(doc);
        clubs.add(club);
      }
      return clubs;
    } catch (e) {
      print("Error fetching clubs: $e");
      return [];
    }
  }
}
