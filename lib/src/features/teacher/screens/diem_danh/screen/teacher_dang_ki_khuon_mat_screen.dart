import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_dang_ky_khuon_mat_controller.dart';
import 'dart:math' as math;

import '../../../../../common_widgets/face_detection_widget/camera_header.dart';
import '../../../../../common_widgets/face_detection_widget/face_painter.dart';

class TeacherDangKiKhuonMatScreen extends StatelessWidget {
  const TeacherDangKiKhuonMatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double mirror = math.pi;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final dangKyKhuonMatController = Get.put(TeacherDangKyKhuonMatController());

    if (dangKyKhuonMatController.initializing.value){
      return Scaffold(
        body: Stack(
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            CameraHeader(
              "SIGN UP",
              onBackPressed: ()=>Navigator.of(context).pop(),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,);
      // floatingActionButton: !_bottomSheetVisible
      //     ? AuthActionButton(
      //   onPressed: onShot,
      //   isLogin: false,
      //   reload: _reload,
      // )
      //     : Container());
    }

    if (!dangKyKhuonMatController.initializing.value && dangKyKhuonMatController.pictureTaken.value){
      return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(mirror),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.file(File(dangKyKhuonMatController.imagePath!)),
                  )),
            ),
            CameraHeader(
              "SIGN UP",
              onBackPressed: ()=>Navigator.of(context).pop(),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,);
      // floatingActionButton: !_bottomSheetVisible
      //     ? AuthActionButton(
      //   onPressed: onShot,
      //   isLogin: false,
      //   reload: _reload,
      // )
      //     : Container());
    }

    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 1.0,
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: SizedBox(
                    width: width,
                    height:
                    width * dangKyKhuonMatController.cameraService.cameraController!.value.aspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        CameraPreview(dangKyKhuonMatController.cameraService.cameraController!),
                        CustomPaint(
                          painter: FacePainter(
                              face: dangKyKhuonMatController.faceDetected.value,
                              imageSize: dangKyKhuonMatController.imageSize!
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          CameraHeader(
            "SIGN UP",
            onBackPressed: ()=>Navigator.of(context).pop(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,);
    // floatingActionButton: !_bottomSheetVisible
    //     ? AuthActionButton(
    //   onPressed: onShot,
    //   isLogin: false,
    //   reload: _reload,
    // )
    //     : Container());
  }
}
