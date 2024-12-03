import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/club/club_model.dart';
import 'package:kindergarten_app/src/features/student/models/enrolledClub/enrolled_club_model.dart';
import 'package:kindergarten_app/src/repository/club_repository/club_repository.dart';
import 'package:kindergarten_app/src/repository/enrolled_club_repository/enrolled_club_repository.dart';
import 'package:kindergarten_app/src/repository/teacher_repository/teacher_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../models/enrolledClub/enrolled.dart';


class NgoaiKhoaController extends GetxController{
  static NgoaiKhoaController get instance => Get.find();
  final _clubRepo = Get.put(ClubRepository());
  final _enrolledClubRepo = Get.put(EnrolledClubRepository());

  late EnrolledClubModel enrolledClubModel;
  late ClubModel club;


  @override
  Future<void> onInit() async {
    super.onInit();
    enrolledClubModel = (await _enrolledClubRepo.getEnrolledClubById())!;
  }

  Future<ClubModel?> getClubById(String clubId) async{
    return await _clubRepo.getClubById(clubId);
  }

  Future<List<ClubModel>> getClubData() async{
    return await _clubRepo.allClub();
  }

  Future<String> loadTeacherName() async {
    final teacherRepo = Get.put(TeacherRepository());
    final teacher = await teacherRepo.getTeacherById(club.teacherID);
    if (teacher!=null){
      return '${teacher.firstName} ${teacher.lastName}';
    }
    else {
      return '';
    }
  }

  Future<EnrolledClubModel?> getEnrolledClubData() async{
    enrolledClubModel = (await _enrolledClubRepo.getEnrolledClubById())!;
    return enrolledClubModel;
  }

  Future<void> enroll() async {
    try{
      final newEnrolled = Enrolled(
        clubID: club.id!,
        enrollDate: Helper.formatDateToString(DateTime.now()),
        enrollStatus: 'Chờ duyệt',
        paymentStatus: 'Chưa thanh toán',
      );
      enrolledClubModel.enrolled.add(newEnrolled);
      final accountRepo = Get.put(AccountRepository());
      enrolledClubModel.id = accountRepo.userId;
      await _enrolledClubRepo.updateEnrolledClub(enrolledClubModel);
      Helper.successSnackBar(
          title: 'Đăng ký thành công',
          message: 'Đăng ký CLB thành công'
      );
    } catch(e){
      print(e);
      Helper.errorSnackBar(
          title: 'Đăng ký thất bại',
          message: 'Đăng ký CLB thất bại'
      );
    }

  }

}