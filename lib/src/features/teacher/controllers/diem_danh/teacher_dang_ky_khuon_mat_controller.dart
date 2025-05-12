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

class TeacherDangKyKhuonMatController extends GetxController {
  Rx<bool> initializing = false.obs;
  Rx<bool> pictureTaken = false.obs;
  Rx<bool> bottomSheetVisible = false.obs;
  String? imagePath;
  Size? imageSize;
  Rx<Face?> faceDetected = Rx<Face?>(null);
  bool _detectingFaces = false;
  bool _saving = false;

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
    initializing.value = true;
    await _initializeServices();
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
            if (_saving){
              mlService.setCurrentPrediction(image, faceDetected.value);
              _saving = false;
            }
          } else {
            print('face is null');
            faceDetected.value = null;
          }
          _detectingFaces = false;
        } catch (e) {
          print('Error _faceDetectorService face => $e');
          _detectingFaces = false;
        }
      }
    });
  }

  reload() {
    bottomSheetVisible.value = false;
    pictureTaken.value = false;
    _start();
  }

  Future<bool> onShot() async {
    if (faceDetected.value == null) {
      Helper.warningSnackBar(
        title: tNhanDienKhuonMat,
        message: tKhongPhatHienDuocKhuonMatNao
      );
      return false;
    } else {
      _saving = true;
      await Future.delayed(const Duration(milliseconds: 200));
      // await cameraService.cameraController?.stopImageStream();
      // await Future.delayed(const Duration(milliseconds: 200));
      XFile? file = await cameraService.takePicture();
      imagePath = file?.path;
      bottomSheetVisible.value = true;
      pictureTaken.value = true;
      return true;
    }
  }
}