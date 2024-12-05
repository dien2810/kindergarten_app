import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten_app/src/features/student/models/teacher/teacher_model.dart';
import 'package:kindergarten_app/src/repository/club_repository/club_teacher_repository.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/teacher_repository/teacher_repository.dart';
import '../../../student/models/club/club_model.dart';
import '../../../student/models/club/day_of_week.dart';
import '../../../student/models/semester_tc/semester_tc_model.dart';

class TeacherNgoaiKhoaController extends GetxController {
  static TeacherNgoaiKhoaController get instance => Get.find();
  RxList<ClubModel> clubs = RxList<ClubModel>([]);
  RxList<SemesterTcModel> semesters = RxList<SemesterTcModel>([]);
  RxString selectedSemester = ''.obs;
  RxBool isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxMap<String, DayOfWeek> dayOfWeekMap = <String, DayOfWeek>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSemesters();
  }

  Future<void> fetchSemesters() async {
    try {
      final snapshot = await _firestore.collection('semester').get();
      final semestersData = snapshot.docs.map((doc) => SemesterTcModel.fromFirestore(doc)).toList();
      semesters.assignAll(semestersData);
      print("Fetched ${semestersData.length} semesters");
    } catch (e) {
      print("Error fetching semesters: $e");
    }
  }

  Future<void> fetchClubsBySemesterAndTeacher(String semesterID) async {
    try {
      isLoading.value = true;
      final accountRepo = Get.put(AccountRepository());
      String username = accountRepo.userId;
      final teacherRepo = Get.put(TeacherRepository());
      String teacherID = await teacherRepo.getTeacherIDByTeacherID(username); // Đợi kết quả của Future

      if (teacherID.isEmpty) {
        print("Error: Teacher ID is empty");
        return;
      }

      print("Fetching clubs for teacherID: $teacherID and semesterID: $semesterID");
      var fetchedClubs = await ClubTeacherRepository.getClubsBySemesterAndTeacher(semesterID, teacherID);
      clubs.assignAll(fetchedClubs);
      print("Fetched ${fetchedClubs.length} clubs");
    } catch (e) {
      print("Error fetching clubs: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addNewClub(ClubModel newClub) async {
    try {
      isLoading.value = true;
      await _firestore.collection('club').add({
        'aboutCourse': newClub.aboutCourse,
        'capacity': newClub.capacity,
        'closedRegistration': newClub.closedRegistration,
        'clubName': newClub.clubName,
        'openedRegistration': newClub.openedRegistration,
        'openingDay': newClub.openingDay,
        'room': newClub.room,
        'semesterID': newClub.semesterID,
        'teacherID': newClub.teacherID,
        'tuition': newClub.tuition,
        'dayOfWeek': newClub.dayOfWeek.map((key, value) => MapEntry(key, {
          'startTime': value.startTime,
          'endTime': value.endTime,
        })),
      });
      print("New club added successfully");
      await fetchClubsBySemesterAndTeacher(newClub.semesterID);
    } catch (e) {
      print("Error adding new club: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<String> getDaysOfWeek() {
    return ['Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy', 'Chủ Nhật'];
  }

  String convertDayToVietnamese(String day) {
    Map<String, String> days = {
      'Monday': 'Thứ Hai',
      'Tuesday': 'Thứ Ba',
      'Wednesday': 'Thứ Tư',
      'Thursday': 'Thứ Năm',
      'Friday': 'Thứ Sáu',
      'Saturday': 'Thứ Bảy',
      'Sunday': 'Chủ Nhật'
    };
    return days[day] ?? day;
  }

  Future<Future<String?>> getTeacherID() async {
    final accountRepo = Get.put(AccountRepository());
    String username  = accountRepo.userId;
    final teacherRepo = Get.put(TeacherRepository());
    Future<String?> teacherID =  teacherRepo.getTeacherIDByTeacherID(username);
    return  teacherID ;
  }
}
