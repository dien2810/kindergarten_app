import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/classes/classes_model.dart';
import 'package:kindergarten_app/src/features/student/models/student/student_model.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/classes_repository/classes_respository.dart';
import 'package:kindergarten_app/src/repository/semester_repos/semester_teacher_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../student/models/semester/semester_model.dart';

class TeacherGiangDayController extends GetxController{
  static TeacherGiangDayController get instance => Get.find();

  RxString selectedAcademicYear = ''.obs;
  late SemesterModel semester;

  final _classesRepo = Get.put(ClassesRepository());
  ClassesModel? classModel;

  Rx<DateTime> selectedDay = DateTime.now().obs;

  Future<List<SemesterModel>> getSemesterList() async{
    final semesterRepo = Get.put(SemesterRepository());
    return await semesterRepo.getSemesterList();
  }

  Future<List<ClassesModel>?> getClassesData() async{
    final accountRepo = Get.put(AccountRepository());
    List<ClassesModel> classList = await _classesRepo.getClassesBySemesterAndTeacherId(semester.id!, accountRepo.userId);
    return classList;
  }

  Future<StudentModel?> getStudentByStudentId(String studentId) async{
    final studentRepo = Get.put(StudentRepository());
    return await studentRepo.getStudentByStudentId(studentId);

  }
}