import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../services/camera_service.dart';
import '../../services/face_detector_service.dart';
import 'face_painter.dart';

class CameraDetectionPreview extends StatelessWidget {
  const CameraDetectionPreview({super.key, required this.cameraService, required this.faceDetectorService});

  final CameraService cameraService;
  final FaceDetectorService faceDetectorService;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Transform.scale(
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
              width * cameraService.cameraController!.value.aspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CameraPreview(cameraService.cameraController!),
                  if (faceDetectorService.faceDetected)
                    CustomPaint(
                      painter: FacePainter(
                        face: faceDetectorService.faces[0],
                        imageSize: cameraService.getImageSize(),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
