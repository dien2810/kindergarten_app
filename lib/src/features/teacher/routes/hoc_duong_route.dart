
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_chuyen_can/screen/teacher_chuyen_can_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/screen/teacher_lich_su_nhan_xet_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/teacher_thong_tin_suc_khoe_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/dan_thuoc/screen/teacher_dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/screen/teacher_giang_day_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/ngoai_khoa/screen/teacher_ngoai_khoa_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thuc_don/screen/teacher_thuc_don_screen.dart';

import '../screens/chi_tiet_hoc_sinh/teacher_thong_tin_hoc_sinh/screen/teacher_thong_tin_ca_nhan_hoc_sinh_screen.dart';
import '../screens/ngoai_khoa/chi_tiet_thanh_vien_clb/teacher_lich_su_nhan_xet/screen/teacher_clb_lich_su_nhan_xet_screen.dart';
import '../screens/ngoai_khoa/chi_tiet_thanh_vien_clb/teacher_suc_khoe_hoc_sinh/teacher_clb_thong_tin_suc_khoe_hoc_sinh_screen.dart';
import '../screens/ngoai_khoa/chi_tiet_thanh_vien_clb/teacher_thong_tin_hoc_sinh/screen/teacher_clb_thong_tin_ca_nhan_hoc_sinh_screen.dart';

class HocDuongRoutes {
  static const String thongTinCaNhan = '/thongTinCaNhan';
  static const String thongTinSucKhoe = '/thongTinSucKhoe';
  static const String lichSuNhanXet = '/lichSuNhanXet';


  // route const cho câu lạc bộ :
  static const String thongTinCaNhanCLB = '/thongTinCaNhanCLB';
  static const String thongTinSucKhoeCLB = '/thongTinSucKhoeCLB';
  static const String lichSuNhanXetCLB = '/lichSuNhanXetCLB';


  static const String chuyenCan = '/chuyenCan';
  static final routes = [
    GetPage(name: '/TeacherDanThuoc', page: () => const TeacherDanThuocScreen()),
    GetPage(name: '/TeacherThucDon', page: () => const TeacherThucDonScreen()),
    GetPage(name:  '/TeacherGiangDay', page: ()=> const TeacherGiangDayScreen()),
    GetPage(name: '/TeacherNgoaiKhoa', page: () => const TeacherNgoaiKhoaScreen()),
    GetPage(
      name: '/thongTinCaNhan',
      page: () {
        // Truyền tham số 'studentName' khi điều hướng
        final arguments = Get.arguments;
        final studentName = arguments['studentName'] ?? 'Chưa có tên';
        final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
        final student = arguments['student'];
        return TeacherThongTinCaNhanHocSinhScreen(student: student);
      },
    ),
    GetPage(name: '/thongTinSucKhoe', page: () {
      // Truyền tham số 'studentName' khi điều hướng
      final arguments = Get.arguments;
      final studentName = arguments['studentName'] ?? 'Chưa có tên';
      final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
      final student = arguments['student'];
      return TeacherThongTinSucKhoeHocSinhScreen(student: student);
    }, ),
    GetPage(name: '/lichSuNhanXet', page: () {
      // Truyền tham số 'studentName' khi điều hướng
      final arguments = Get.arguments;
      final studentName = arguments['studentName'] ?? 'Chưa có tên';
      final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';

      // data mẫu
      String guardianID = "guardian_id_1"; // ID phụ huynh
      String replyContent = "hello world"; // Nội dung trả lời, có thể để trống
      String commentDate = DateTime.now().toLocal().toString().split(' ')[0]; // Ngày nhận xét
      String teacherID = "teacher_id_1"; // ID giáo viên
      String studentID = "student_id_1"; // ID học sinh

      // Gọi TeacherLichSuNhanXetScreen
      return TeacherLichSuNhanXetScreen(
        studentName: studentName,
        imageUrl: imageUrl,
        guardianID: guardianID,
        replyContent: replyContent,
        commentDate: commentDate,
        teacherID: teacherID, // Truyền ID giáo viên
        studentID: studentID, // Truyền ID học sinh
        onAddComment: (String comment) {
          // Logic để thêm nhận xét
          print("Nhận xét được thêm: $comment");
          // Bạn có thể gọi hàm để cập nhật nhận xét ở đây
        },
      );
    },),
   GetPage(name: '/chuyenCan',  page: () {
     final arguments = Get.arguments;
     final studentName = arguments['studentName'] ?? 'Chưa có tên';
     final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
     return TeacherChuyenCanHocSinhScreen(studentName: studentName, imageUrl: imageUrl,);
   },
   ),

    // route cho câu lạc bộ :

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    GetPage(
      name: '/thongTinCaNhanCLB',
      page: () {
        // Truyền tham số 'studentName' khi điều hướng
        final arguments = Get.arguments;
        final studentName = arguments['studentName'] ?? 'Chưa có tên';
        final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
        return TeacherClbThongTinCaNhanHocSinhScreen(studentName: studentName, imageUrl: imageUrl,);
      },
    ),
    GetPage(name: '/thongTinSucKhoeCLB', page: () {
      // Truyền tham số 'studentName' khi điều hướng
      final arguments = Get.arguments;
      final studentName = arguments['studentName'] ?? 'Chưa có tên';
      final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
      return TeacherClbThongTinSucKhoeHocSinhScreen(studentName: studentName, imageUrl: imageUrl,);
    }, ),
    GetPage(name: '/lichSuNhanXetCLB', page: () {
      // Truyền tham số 'studentName' khi điều hướng
      final arguments = Get.arguments;
      final studentName = arguments['studentName'] ?? 'Chưa có tên';
      final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
      print("object : //////////////////////// vào lịch sử nhận xét clb");
      // data mẫu
      String guardianID = "guardian_id_1"; // ID phụ huynh
      String replyContent = "hello world"; // Nội dung trả lời, có thể để trống
      String commentDate = DateTime.now().toLocal().toString().split(' ')[0]; // Ngày nhận xét
      String teacherID = "teacher_id_1"; // ID giáo viên
      String studentID = "student_id_1"; // ID học sinh

      // Gọi TeacherClbLichSuNhanXetScreen
      return TeacherClbLichSuNhanXetScreen(
        studentName: studentName,
        imageUrl: imageUrl,
        guardianID: guardianID,
        replyContent: replyContent,
        commentDate: commentDate,
        teacherID: teacherID, // Truyền ID giáo viên
        studentID: studentID, // Truyền ID học sinh
        onAddComment: (String comment) {
          // Logic để thêm nhận xét
          print("Nhận xét được thêm: $comment");
          // Bạn có thể gọi hàm để cập nhật nhận xét ở đây
        },
      );
    },),


  ];
}
