import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/services/camera_service.dart';
import 'package:kindergarten_app/src/services/face_detector_service.dart';
import 'package:kindergarten_app/src/services/ml_service.dart';

import '../../../../utils/helper_controller/helper_controller.dart';

class TeacherNhanDienKhuonMatController extends GetxController {
  Rx<bool> isInitializing = false.obs;
  Rx<bool> isPictureTaken = false.obs;
  Rx<bool> bottomSheetVisible = false.obs;
  String? imagePath;
  Size? imageSize;
  Rx<Face?> faceDetected = Rx<Face?>(null);

  final CameraService cameraService = Get.put(CameraService());
  final FaceDetectorService faceDetectorService = Get.put(FaceDetectorService());
  final MLService mlService = Get.put(MLService());

  @override
  void onInit() {
    super.onInit();
    _start();
  }

  _initializeServices() async {
    await cameraService.initialize();
    await mlService.initialize();
    faceDetectorService.initialize();
  }

  _start() async {
    isInitializing.value = true;
    await _initializeServices();
    isInitializing.value = false;
    frameFaces();
  }

  frameFaces(){
    bool processing = false;
    imageSize = cameraService.getImageSize();
    cameraService.cameraController!
        .startImageStream((CameraImage image) async {
      if (processing) return; // prevents unnecessary overprocessing.
      processing = true;
      await _predictFacesFromImage(image: image);
      processing = false;
    });
  }

  Future<void> _predictFacesFromImage({@required CameraImage? image}) async {
    assert(image != null, 'Image is null');
    await faceDetectorService.detectFacesFromImage(image!);
    if (faceDetectorService.faceDetected) {
      faceDetected.value = faceDetectorService.faces[0];
      mlService.setCurrentPrediction(image, faceDetectorService.faces[0]);
    }
    // if (mounted) setState(() {});
  }

  Future<void> takePicture() async {
    if (faceDetectorService.faceDetected) {
      await cameraService.takePicture();
      isPictureTaken.value = true;
    } else {
      Helper.warningSnackBar(title: tNhanDienKhuonMat, message: tKhongPhatHienDuocKhuonMatNao);
    }
  }

  reload() {
    bottomSheetVisible.value = false;
    isPictureTaken.value = false;
    _start();
  }
}