import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TeacherThongTinHocSinhController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var hasPhoto4x6 = false.obs;
  var hasBirthCertificate = false.obs;
  var hasHouseholdRegistration = false.obs;

  void pickImage(String type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (type == 'photo4x6') {
        hasPhoto4x6.value = true;
      } else if (type == 'birthCertificate') {
        hasBirthCertificate.value = true;
      } else if (type == 'householdRegistration') {
        hasHouseholdRegistration.value = true;
      }
    }
  }
}

class StudentRecord {
  String hoTenCha;
  String hoTenMe;
  String ngheNghiepCuaCha;
  String ngheNghiepCuaMe;
  String soDienThoai;
  String diaChiEmail;
  String diaChiThuongTru;

  StudentRecord({
    required this.hoTenCha,
    required this.hoTenMe,
    required this.ngheNghiepCuaCha,
    required this.ngheNghiepCuaMe,
    required this.soDienThoai,
    required this.diaChiEmail,
    required this.diaChiThuongTru,
  });
}
StudentRecord record = StudentRecord(
  hoTenCha: "Nguyễn Văn A",
  hoTenMe: "Nguyễn Thị B",
  ngheNghiepCuaCha: "Kỹ sư",
  ngheNghiepCuaMe: "Giáo viên",
  soDienThoai: "0123456789",
  diaChiEmail: "email@example.com ",
  diaChiThuongTru: "123 Đường ABC",
);
class StudentInfo {
  String hoTen;
  String maHocSinh;
  String ngaySinh;
  String gioiTinh;
  String truong;
  String he;
  String khoi;
  String lop;

  StudentInfo({
    required this.hoTen,
    required this.maHocSinh,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.truong,
    required this.he,
    required this.khoi,
    required this.lop,
  });
}
StudentInfo student = StudentInfo(
  hoTen: "Nguyễn Văn An",
  maHocSinh: "HS001",
  ngaySinh: "01/01/2010",
  gioiTinh: "Nam",
  truong: "Trường Tiểu Học ABC",
  he: "Chương trình chính quy ",
  khoi: "Khối 5",
  lop: "Lớp 5A",
);