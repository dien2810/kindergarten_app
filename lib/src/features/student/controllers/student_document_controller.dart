import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_tin_hoc_sinh/thong_tin_hoc_sinh_controller.dart';

class StudentDocumentController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final _thongTinHocSinhController = Get.put(ThongTinHocSinhController());

  var hasPhoto4x6 = false.obs;
  var hasBirthCertificate = false.obs;
  var hasHouseholdRegistration = false.obs;

  void pickImage(String type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (type == 'photo4x6') {
        hasPhoto4x6.value = true;
        _thongTinHocSinhController.anhHocSinh.text = image.path;
      } else if (type == 'birthCertificate') {
        hasBirthCertificate.value = true;
        _thongTinHocSinhController.anhGiayKhaiSinh.text = image.path;
      } else if (type == 'householdRegistration') {
        hasHouseholdRegistration.value = true;
        _thongTinHocSinhController.anhSoHoKhau.text = image.path;
      }
    }
  }
}
