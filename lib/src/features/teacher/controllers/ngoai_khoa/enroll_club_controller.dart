import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../student/models/enrolledClub/enrolled.dart';
import '../../../student/models/enrolledClub/enrolled_club_model.dart';
import '../../../student/models/student/student_model.dart';

class EnrolledClubController extends GetxController {
  RxList<StudentModel> members = RxList<StudentModel>([]);
  RxBool isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> fetchMembers(String clubID) async {
    try {
      isLoading.value = true;
      members.clear();

      final snapshot = await _firestore.collection('enrolledClub').get();

      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          EnrolledClubModel enrolledClub = EnrolledClubModel.fromMap(doc.data() as Map<String, dynamic>);
          enrolledClub.id = doc.id;

          for (Enrolled enrolled in enrolledClub.enrolled) {
            if (enrolled.clubID == clubID) {
              final studentQuerySnapshot = await _firestore.collection('student').doc(enrolledClub.id).get();
              if (studentQuerySnapshot.exists) {
                if (!members.any((m) => m.id == studentQuerySnapshot.id)) {
                  members.add(StudentModel.fromMap(studentQuerySnapshot.data() as Map<String, dynamic>));
                }
              }
            }
          }
        }
      }
    } catch (e) {
      print("Error fetching members: $e");
    } finally {
      isLoading.value = false;
    }
  }

}
