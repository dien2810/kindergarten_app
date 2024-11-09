import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StudentDocumentController extends GetxController {
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
