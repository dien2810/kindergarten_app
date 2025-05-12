import 'package:get/get.dart';
import 'package:kindergarten_app/src/services/face_detector_service.dart';

import '../../../../services/camera_service.dart';
import '../../../../services/ml_service.dart';


class TeacherDiemDanhTuDongController extends GetxController {
  Rx<bool> loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}