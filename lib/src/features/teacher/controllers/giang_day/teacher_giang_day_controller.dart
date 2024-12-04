import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/classes/classes_model.dart';
import 'package:kindergarten_app/src/features/student/models/student/student_model.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/repository/classes_repository/classes_respository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

class TeacherGiangDayController extends GetxController{
  static TeacherGiangDayController get instance => Get.find();

  final _classesRepo = Get.put(ClassesRepository());
  ClassesModel? classModel;

  Rx<DateTime> selectedDay = DateTime.now().obs;

  Future<ClassesModel?> getClassesData() async{
    final accountRepo = Get.put(AccountRepository());
    classModel = await _classesRepo.getClassesByTeacherId(accountRepo.userId);
    return classModel;
  }

  Future<StudentModel?> getStudentByStudentId(String studentId) async{
    final studentRepo = Get.put(StudentRepository());
    return await studentRepo.getStudentByStudentId(studentId);

  }
}