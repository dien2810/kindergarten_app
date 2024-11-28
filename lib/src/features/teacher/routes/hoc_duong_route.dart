
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_chuyen_can/screen/teacher_chuyen_can_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/screen/teacher_lich_su_nhan_xet_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/teacher_thong_tin_suc_khoe_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/dan_thuoc/screen/teacher_dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/screen/teacher_giang_day_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/hoc_duong/screen/hoc_duong_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thuc_don/screen/teacher_thuc_don_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/trang_chu/trang_chu_giao_vien.dart';

import '../screens/chi_tiet_hoc_sinh/teacher_thong_tin_hoc_sinh/screen/teacher_thong_tin_ca_nhan_hoc_sinh_screen.dart';

class HocDuongRoutes {
  static const String thongTinCaNhan = '/thongTinCaNhan';
  static const String thongTinSucKhoe = '/thongTinSucKhoe';
  static const String lichSuNhanXet = '/lichSuNhanXet';
  static const String chuyenCan = '/chuyenCan';
  static final routes = [
    GetPage(name: '/HocDuong', page: () => const HocDuongScreen()),
    GetPage(name: '/TeacherDanThuoc', page: () => const TeacherDanThuocScreen()),
    GetPage(name: '/TeacherThucDon', page: () => const TeacherThucDonScreen()),
    GetPage(name:  '/TeacherGiangDay', page: ()=> const TeacherGiangDayScreen()),
    GetPage(
      name: '/thongTinCaNhan',
      page: () {
        // Truyền tham số 'studentName' khi điều hướng
        final arguments = Get.arguments;
        final studentName = arguments['studentName'] ?? 'Chưa có tên';
        final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
        return TeacherThongTinCaNhanHocSinhScreen(studentName: studentName, imageUrl: imageUrl,);
      },
    ),
    GetPage(name: '/thongTinSucKhoe', page: () {
      // Truyền tham số 'studentName' khi điều hướng
      final arguments = Get.arguments;
      final studentName = arguments['studentName'] ?? 'Chưa có tên';
      final imageUrl =arguments['imageUrl'] ?? 'chưa có ảnh';
      return TeacherThongTinSucKhoeHocSinhScreen(studentName: studentName, imageUrl: imageUrl,);
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
  ];
}
