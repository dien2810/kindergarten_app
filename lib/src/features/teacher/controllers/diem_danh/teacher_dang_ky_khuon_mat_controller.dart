import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:kindergarten_app/src/services/camera_service.dart';
import 'package:kindergarten_app/src/services/face_detector_service.dart';
import 'package:kindergarten_app/src/services/ml_service.dart';

class TeacherDangKyKhuonMatController extends GetxController {
  Rx<bool> initializing = false.obs;
  Rx<bool> pictureTaken = false.obs;
  String? imagePath;
  Size? imageSize;
  late Rx<Face?> faceDetected;
  bool _detectingFaces = false;
  final Rx<bool> _saving = false.obs;

  final CameraService cameraService = Get.put(CameraService());
  final FaceDetectorService faceDetectorService = Get.put(FaceDetectorService());
  final MLService mlService = Get.put(MLService());

  start() async {
    initializing.value = true;
    await cameraService.initialize();
    initializing.value = false;

    frameFaces();
  }

  frameFaces(){
    imageSize = cameraService.getImageSize();

    cameraService.cameraController?.startImageStream((image) async {
      if (cameraService.cameraController != null){
        if (_detectingFaces) return;
        _detectingFaces = true;
        try{
          await faceDetectorService.detectFacesFromImage(image);
          if (faceDetectorService.faces.isNotEmpty){
            faceDetected.value = faceDetectorService.faces[0];
            if (_saving.value){
              mlService.setCurrentPrediction(image, faceDetected.value);
              _saving.value = false;
            }
          } else {
            print('face is null');
            faceDetected.value = null;
          }
        } catch (e) {
          print('Error _faceDetectorService face => $e');
          _detectingFaces = false;
        }
      }
    });
  }
}